import os
import signal
import subprocess
import sys
import time
from pathlib import Path
from time import sleep
from fabric import Connection
import psutil
import socket
from typing import Tuple


def kill_process(proc_name):
    for proc in psutil.process_iter():
        try:
            if proc_name.lower() in proc.name().lower():
                print('Killing previous instance of %s' % proc_name)
                proc.terminate()
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            raise


def check_cap_net_raw(path_file):
    f_basename = os.path.basename(path_file)
    print('Check if CAP_NET_RAW is properly set to %s' % f_basename)
    cap = subprocess.check_output(['getcap', path_file]).decode('utf-8').rstrip().replace(' ', '')
    if ('cap_net_raw' not in cap) or ('cap_net_raw' in cap and 'eip' not in cap):
        print('It is necessary to set CAP_NET_RAW: the procedure now starts')
        os.system('sudo setcap cap_net_raw=eip %s' % path_file)
    else:
        print('CAP_NET_RAW is already properly set to %s' % f_basename)


def save_path_on_file(root_dir, path_file, del_previous_file=False):
    filename = os.path.join(root_dir, 'traces_used.txt')
    mod_file = 'a' if not del_previous_file else 'w'
    with open(filename, mod_file) as f:
        f.write('%s\n' % path_file)


def check_ditg_version(ditg_bin_path, is_remote: bool = True, connection: Connection = None) -> dict:
    ditg_exe_path = {'ITGSend': os.path.join(ditg_bin_path, 'ITGSend'),
                     'ITGRecv': os.path.join(ditg_bin_path, 'ITGRecv')}
    if is_remote:
        if connection is not None:
            ssh_ls_p = connection.run('ls {}'.format(ditg_bin_path), hide=True)
            ditg_bin_filename_list = ssh_ls_p.stdout.split('\n')
        else:
            sys.exit('If DITG is remote (is_remote=True), you have to specify a correct \'connection\' parameter. '
                     'See \'fabric\' documentation.')
    else:
        ditg_bin_filename_list = os.listdir(ditg_bin_path)

    ditg_bin_debug_filename_list = ['ITGSendD', 'ITGRecvD']
    for ditg_bin_debug in ditg_bin_debug_filename_list:
        if ditg_bin_debug in ditg_bin_filename_list:
            ditg_exe_path[ditg_bin_debug[:-1]] = os.path.join(ditg_bin_path, ditg_bin_debug)

    return ditg_exe_path


def exe_ditg(trace_path: str, n_exp: int, output_dir: str, recv_logging_root_dir: str, ditg_bin_path: str,
             username: str, private_key_path: str, ditg_remote_bin_path: str, meter: str, dest_address: str,
             src_address: str, dest_port: int, src_port: int, protocol: str, pcap_bidirectional: bool,
             poll_busy_wait: bool, mean_packet_rate: int, enable_capture: bool, enable_nice: Tuple[bool, int],
             enable_ionice : Tuple[bool, int, int], is_disable_nagle: bool, enable_poll: Tuple[bool, int],
             client_interface: str, server_interface: str, snaplen: int = -1, connection: Connection = None):

    Path(output_dir).mkdir(parents=True, exist_ok=True)
    if connection is None:
        connection = Connection(host=dest_address, user=username, port=22,
                                connect_kwargs={'key_filename': private_key_path})
    ditg_exe_path = check_ditg_version(ditg_bin_path, is_remote=False)
    ditg_exe_remote_path = check_ditg_version(ditg_remote_bin_path, is_remote=True, connection=connection)

    itgsend_command_list = []
    niceness_priority = 10  # Default Linux niceness
    if enable_nice[0]:
        niceness_priority = enable_nice[1]
    itgsend_command_list.extend(['nice', '-%s' % str(niceness_priority)])

    ionice_class = 2  # Default Linux ionice class (best-effort)
    ionice_level = 4  # Linux default ionice level
    if enable_ionice[0]:
        ionice_class = enable_ionice[1]
        ionice_level = enable_ionice[2]
        if not enable_nice[0]:
            itgsend_command_list.append('sudo')
    itgsend_command_list.extend(['ionice', '-c', str(ionice_class), '-n', str(ionice_level)])
    recv_log_dir = recv_logging_root_dir
    receiver_logfile_path = os.path.join(recv_log_dir, 'receiver.log')
    ssh_mkdir_p = connection.run('mkdir -p {}'.format(recv_log_dir))
    logfile_path = os.path.join(output_dir, 'sender.log')
    itgsend_command_list.extend([ditg_exe_path['ITGSend'], '-l', logfile_path, '-x', receiver_logfile_path, '-m', meter,
                                 '-a', dest_address, '-sa', src_address, '-rp', str(dest_port), '-sp', str(src_port),
                                 '-T', protocol])
    if is_disable_nagle:
        itgsend_command_list.append('-D')
    itgsend_command_list.extend(['-j', str(mean_packet_rate)])
    if poll_busy_wait:
        itgsend_command_list.append('-poll')

    if enable_poll[0]:
        itgsend_command_list.extend(['-Z', enable_poll[1]])

    itgsend_command_list.extend(['PCAP', trace_path])
    if pcap_bidirectional:
        itgsend_command_list.append('-Pb')

    print('Trace: %s' % trace_path)
    sender_log_filename = os.path.splitext(os.path.basename(logfile_path))[0]
    receiver_log_filename = os.path.splitext(os.path.basename(receiver_logfile_path))[0]

    for j in range(n_exp):
        sender_log_exp_filename = '{}_exp_{}.log'.format(sender_log_filename, j)
        idx_l_opt = itgsend_command_list.index('-l')
        itgsend_command_list[idx_l_opt + 1] = os.path.join(os.path.dirname(logfile_path), sender_log_exp_filename)

        receiver_log_exp_filename = '{}_exp_{}.log'.format(receiver_log_filename, j)
        idx_x_opt = itgsend_command_list.index('-x')
        itgsend_command_list[idx_x_opt + 1] = os.path.join(recv_log_dir, receiver_log_exp_filename)
        recv_stderr_path = os.path.join(recv_log_dir, 'recv_stderr_exp_{}.txt'.format(j))
        recv_stdout_path = os.path.join(recv_log_dir, 'recv_stdout_exp_{}.txt'.format(j))
        try:
            # Kill eventually previous instance of ITGRecv and start a new one
            print('Trying to kill previous istance of ITGRecv')
            connection.run('pkill -15 {} && echo "Killed previous istance of ITGRecv" || echo "ITGRecv is NOT yet running"'.format(os.path.basename(ditg_exe_remote_path['ITGRecv'])))
            print('ITGRecv start')
            connection.run('{} 2> {} 1> {} &'.format(ditg_exe_remote_path['ITGRecv'],
                                                     recv_stderr_path, recv_stdout_path))
            if enable_capture:
                server_capture_file = os.path.join(recv_log_dir, 'cap_server_exp_{}.pcap'.format(j))
                # cap_remote_cmd = 'screen -d -m tcpdump -i %s' % server_interface
                cap_remote_cmd = 'tcpdump -i {}'.format(server_interface)
                if snaplen >= 0:
                    cap_remote_cmd = '{} -s {}'.format(cap_remote_cmd, snaplen)
                cap_remote_cmd = 'screen -d -m {} -w {}'.format(cap_remote_cmd, server_capture_file)
                print(cap_remote_cmd)
                connection.run(cap_remote_cmd)
                sleep(1)
            print('ITGSend start')
            print(itgsend_command_list)

            # Check if socket is free
            skt_busy = True
            while skt_busy:
                skt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                try:
                    # skt.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                    skt.bind(('0.0.0.0', src_port))
                    skt_busy = False
                except socket.error as msg:
                    print('Socket binding error: %s\nWait 2 seconds for a new attempt' % msg)
                    sleep(2)
                skt.close()

            if enable_capture:
                capture_file = os.path.join(output_dir, 'cap_client_exp_{}.pcap'.format(j))
                print('Capture start')
                cap_cmd_list = ['tcpdump', '-i', client_interface]
                if snaplen >= 0:
                    cap_cmd_list.extend(['-s', str(snaplen)])
                cap_cmd_list.extend(['-w', capture_file])
                print(cap_cmd_list)
                capture_p = subprocess.Popen(args=cap_cmd_list)
            # Open stdout and stderr file and run DITG with the specified parameters
            send_stdout_path = open(os.path.join(output_dir, 'send_stdout_exp_{}.txt'.format(j)), 'w')
            send_stderr_path = open(os.path.join(output_dir, 'send_stderr_exp_{}.txt'.format(j)), 'w')
            sleep(2)
            subprocess.run(args=itgsend_command_list, stdout=send_stdout_path, stderr=send_stderr_path,
                           encoding='utf-8')
            sleep(2)
            if enable_capture:
                print('Capture stop')
                connection.run('pkill -15 tcpdump')
                capture_p.send_signal(signal.SIGTERM)
            print('Stopping ITGRecv')
            connection.run('pkill -15 {} && echo "Killed istance of ITGRecv" || echo "ITGRecv has already been killed"'.format(os.path.basename(ditg_exe_remote_path['ITGRecv'])))
            print('{} experiment {}: traffic sent!'.format(os.path.basename(trace_path), j))
            send_stdout_path.close()
            send_stderr_path.close()
        except subprocess.CalledProcessError as e:
            print("Oops... return code: {}, output: {}".format(e.returncode, e.output))
            sys.exit(1)
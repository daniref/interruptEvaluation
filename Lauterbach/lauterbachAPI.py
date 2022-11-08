import argparse
import ctypes
import array
import os
import time
from ctypes import *
import enum
import psutil

class PracticeState(enum.IntEnum):
    UNKNOWN = -1
    NOT_RUNNING = 0
    RUNNING = 1
    DIALOG_OPEN = 2

class TraceType(enum.IntEnum):
    TRACE = 0                       # Il nostro caso d'interesse in quanto non abbiamo un PowerIntegrator
    INTEGRATOR = 1

class Trace32State(enum.IntEnum):
    UNKNOWN = -1
    DOWN = 0
    NOACCESS = 1
    HALTED = 2
    RUNNING = 3

t32api = CDLL("/home/oppy/Utilities/t32/demo/api/python/legacy/t32api64.so")
T32_DEV = 1

class LAUTERBACH():
    def __init__(self):
        super().__init__()

    def find_process(self,name):
        processes_list = []
        for process in psutil.process_iter():
            try:
                process_info = process.as_dict(attrs=['pid', 'name', 'create_time'])
                if name.lower() in process_info['name'].lower():
                    processes_list.append(process_info)
            except(psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                pass
        return processes_list

    def open_trace(self):
        if len(self.find_process('t32marm')) > 0:
            print("Lauterbach: TRACE32 already opened!")
        else:
            cwd = os.getcwd()
            os.system("/home/oppy/Utilities/t32/bin/pc_linux64/t32marm -c "+cwd+"/Lauterbach/config_usb.t32 "+" &")
            print("Lauterbach: Waiting for TRACE32 to open...")
            time.sleep(8)
            print("Lauterbach: TRACE32 Opened.")

    def connect(self,connection_state):
        if connection_state:
            print("Lauterbach: Already Connected to TRACE32")
            return True

        else:
            # Configure communication channel to an instance
            # of TRACE32 running on the localhost, listening on UDP
            # port 20000
            t32api.T32_Config(b"NODE=", b"localhost")
            t32api.T32_Config(b"PORT=", b"20000")
            t32api.T32_Config(b"PACKLEN=", b"1024")

            # Establish a connection to TRACE32
            rc = t32api.T32_Init()
            if rc != 0:
                print("Lauterbach: T32_Init Error. Is TRACE32 running?")
                return False

            # Sometimes the first attempt to Attach fails but a second will
            # usually succeed. This often happens if the API has been left hanging
            # when the previous user didn't call T32_Exit() before quitting.
            for x in range(0 , 3):
                rc = t32api.T32_Attach(T32_DEV)
                if rc == 0:
                    break
            if rc != 0:
                print("Lauterbach: T32_Attach Error")
                t32api.T32_Exit()
                return False

            # Ping TRACE32 to check the connection really is up and running
            rc = t32api.T32_Ping()
            if rc != 0:
                print("Lauterbach: T32_Ping Error")
                t32api.T32_Exit()
                return False

            connection_state = True
            print("Lauterbach: Connected to TRACE32!")
            return True

    def runscript(self, connection_state, script):
        practice_state = c_int(PracticeState.UNKNOWN)

        if not connection_state:
            print("Lauterbach: Error: No connection established to TRACE32!")
            return

        print("Lauterbach: launched script:"+script)
        current_dir = os.path.dirname(os.path.realpath(__file__))
        cmd = "DO " + current_dir + '/' + script
        print("Lauterbach: Sending script to TRACE32...")
        t32api.T32_Cmd(cmd.encode())

        rc = 0
        while rc == 0 and not practice_state.value == PracticeState.NOT_RUNNING:
            rc = t32api.T32_GetPracticeState(ctypes.byref(practice_state))

        self.disconnect(connection_state)

    def disconnect(self, connection_state):
        if connection_state:
            t32api.T32_Exit()
            #t32api.T32_Cmd(b'quit')
            print("Lauterbach: Disconnected!")
        else:
            print("Lauterbach: Even connected!")

    def get_trace(self, connection_state):
        # check_connection()

        systemstate = c_uint()
        min_record = c_int()
        max_record = c_int()
        total_records = c_int()

        """
        num_bytes indica il numero di dati che ci interessa leggere dalla traccia: tale numero è
        determinato dalla maschera mask
        """
        num_bytes = 20
        mask = 0x070c

        """
        recupero informazioni della traccia, ovvero numero di record totali e id del recrod minimo e massimo
        """
        print("DEBUG 0")
        t32api.T32_GetTraceState(0, byref(systemstate), byref(total_records), byref(min_record), byref(max_record))
        print("DEBUG 1")

        num_records = min_record.value * -1
        # num_records = 400000
        total_bytes = num_bytes * num_records

        print("Numero di record =", num_records)

        """
        buffer contiene i byte dela traccia che interessa leggere
        """

        buf = array.array('i', list(range(total_bytes)))
        buffer = (c_ubyte * total_bytes).from_buffer(buf)
        for i in range(0, sizeof(buffer)):
            buffer[i] = 0x00

        t32api.T32_ReadTrace(0, min_record.value, num_records, mask, buffer)
        self.disconnect(connection_state)
        print("DEBUG 3")

        """
        Interazione con Trace32 finita
        """

        # applications = search_application_id(args.file)
        # for i in range(0, len(applications)):
        #     search_elf(applications[i], os.getcwd() + "/../" + args.app)

        """
        su graph verranno aggiunti i nodi e gi archi
        """
        # g = ig.Graph(directed=True)

        parsed_trace = []

        # Creazione primo record per confronto
        for i in range(0, 2):
            address = '0x' + format(buffer[i + 15], '02X') + format(buffer[i + 14], '02X') + format(buffer[i + 13], '02X') \
                      + format(buffer[i + 12], '02X') + format(buffer[i + 11], '02X') + format(buffer[i + 10], '02X') \
                      + format(buffer[i + 9], '02X') + format(buffer[i + 8], '02X')
            timestamp = format(buffer[i + 7], '02X') + format(buffer[i + 6], '02X') + format(buffer[i + 5], '02X') \
                        + format(buffer[i + 4], '02X') + format(buffer[0 + 3], '02X') + format(buffer[i + 2], '02X') \
                        + format(buffer[i + 1], '02X') + format(buffer[i + 0], '02X')

            cpu_mode = str(format(buffer[i + 19], '02X') + format(buffer[i + 18], '02X'))
            app_info = format(buffer[i + 17], '02X') + format(buffer[i + 16], '02X')
            record = {"address": address, "symbol": '', "timestamp": timestamp, "cpu_mode": cpu_mode, "app_info": app_info}
            parsed_trace.append(record)
        # for i in range(2 * num_bytes, (num_records - 8000000) * num_bytes, num_bytes):
        #     if "38" not in format(buffer[i + 19], '02X') + format(buffer[i + 18], '02X') and "0000" not in format(buffer[i + 17], '02X') + format(buffer[i + 16], '02X'):
        #         address = '0x' + format(buffer[i + 15], '02X') + format(buffer[i + 14], '02X') + format(buffer[i + 13], '02X')\
        #                   + format(buffer[i + 12], '02X') + format(buffer[i + 11], '02X') + format(buffer[i + 10], '02X') \
        #                   + format(buffer[i + 9], '02X') + format(buffer[i + 8], '02X')
        #         timestamp = format(buffer[i + 7], '02X') + format(buffer[i + 6], '02X') + format(buffer[i + 5], '02X') \
        #                     + format(buffer[i + 4], '02X') + format(buffer[i + 3], '02X') + format(buffer[i + 2], '02X') \
        #                     + format(buffer[i + 1], '02X') + format(buffer[i + 0], '02X')
        #
        #         cpu_mode = format(buffer[i + 19], '02X') + format(buffer[i + 18], '02X')
        #         app_info = format(buffer[i + 17], '02X') + format(buffer[i + 16], '02X')
        #
        #         record = {"address": address, "symbol": '', "timestamp": int(timestamp, 16), "cpu_mode": cpu_mode, "app_info": app_info}
        #         if record["address"] == parsed_trace[-2]["address"] and record["address"] == parsed_trace[-1]["address"]:
        #             parsed_trace[-1] = record
        #         else:
        #             parsed_trace.append(record)

        # find_symbols(parsed_trace)
        with open("traccianottimestamppck.txt", 'w') as t:
            for record in parsed_trace:
                t.write(str(record) + '\n')
        # create_first_node(g)
        # build_graph(g, parsed_trace)
        # last_record_node = find_node_by_record(g, parsed_trace[-1])
        # create_last_node(g, last_record_node)

        # for node in g.vs[1:-1]:
        #     node["label"] = node["label"] + ' ' + str((node["content"][-1]["timestamp"] - node["content"][0]["timestamp"])/1000)

        # return g


# if __name__ == "__main__":
#     parser = argparse.ArgumentParser()
#     parser.add_argument("--file", type=str, help="Practice script to launch", default="trace_generator.cmm")
#
#     args = parser.parse_args()
#     script_state = c_uint(0)
#     state = False
#
#     open_trace()
#     state = connect(state)
#     runscript(state, args.file)
#     get_trace()
#     disconnect(state)


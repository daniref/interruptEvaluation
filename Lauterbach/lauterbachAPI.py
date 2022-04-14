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

t32api = CDLL("/home/daniele/t32/demo/api/python/legacy/t32api64.so")
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
            os.system("t32marm -c "+cwd+"/Lauterbach/config_usb.t32 "+" &")
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

        current_dir = os.path.dirname(os.path.realpath(__file__))
        cmd = "DO " + current_dir + '/' + script
        print("Lauterbach: Sending script to TRACE32...")
        t32api.T32_Cmd(cmd.encode())

        rc = 0
        while rc == 0 and not practice_state.value == PracticeState.NOT_RUNNING:
            rc = t32api.T32_GetPracticeState(ctypes.byref(practice_state))

    def disconnect(self, connection_state):
        if connection_state:
            t32api.T32_Exit()
            #t32api.T32_Cmd(b'quit')
            print("Lauterbach: Disconnected!")

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


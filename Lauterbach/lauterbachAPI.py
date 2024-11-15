import argparse
import ctypes
import array
import os
import time
from ctypes import *
import enum
import psutil
from math import ceil

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

t32api = CDLL("/home/daniele/Utilities/t32/demo/api/python/legacy/t32api64.so")
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
            os.system("/home/daniele/Utilities/t32/bin/pc_linux64/t32marm -c "+cwd+"/Lauterbach/config_usb.t32 "+" &")
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

        print("Lauterbach: launched script: "+script)
        current_dir = os.path.dirname(os.path.realpath(__file__))
        cmd = "DO " + current_dir + '/' + script
        # print("Lauterbach: Sending script to TRACE32...")
        t32api.T32_Cmd(cmd.encode())

        rc = 0
        while rc == 0 and not practice_state.value == PracticeState.NOT_RUNNING:
            rc = t32api.T32_GetPracticeState(ctypes.byref(practice_state))

        # self.disconnect(connection_state)

    def disconnect(self, connection_state):
        if connection_state:
            t32api.T32_Exit()
            #t32api.T32_Cmd(b'quit')
            print("Lauterbach: Disconnected!")
        else:
            print("Lauterbach: Even connected!")

    def get_trace(self, connection_state, architecture):

        if architecture == 0:
            address_get_time_main = "0x0000000000000FA8"
            address_get_time_isr = "0x0000000000000D5C"
            address_XGpioPs_WritePin ="0x0000000000001DD0"
            address_XGpioPs_WriteReg = "0x0000000000001E20"
            address_gpio_isr_callback = "0x000000000000104C"
            architecture = "zup"
        else:
            address_get_time_main = "0x00000000000008C4"
            address_get_time_isr = "0x0000000000000880"
            address_XGpioPs_WritePin = "0x0000000000002544"
            address_XGpioPs_WriteReg ="0x0000000000002598"
            address_gpio_isr_callback = "0x0000000000000668"
            architecture = "z7"

        con_state = self.connect(connection_state)
        if not con_state:
            raise ValueError("Error: No connection established to TRACE32!")

        systemstate = c_uint()
        min_record = c_int()
        max_record = c_int()
        total_records = c_int()

        """
        num_bytes indica il numero di dati che ci interessa leggere dalla traccia: tale numero è
        determinato dalla maschera mask
        """
        num_bytes = 16
        mask = 0x030C
        # mask = 0x003C

        """
        recupero informazioni della traccia, ovvero numero di record totali e id del recrod minimo e massimo
        """
        t32api.T32_GetTraceState(0, byref(systemstate), byref(total_records), byref(min_record), byref(max_record))
        # print("Lauterbach: min record =", min_record)

        num_records = min_record.value * -1
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

        filtered_trace = []

        for i in range(0 * num_bytes, (num_records) * num_bytes, num_bytes):
            address = '0x' + format(buffer[i + 15], '02X') + format(buffer[i + 14], '02X') + format(buffer[i + 13], '02X')\
                      + format(buffer[i + 12], '02X') + format(buffer[i + 11], '02X') + format(buffer[i + 10], '02X') \
                      + format(buffer[i + 9], '02X') + format(buffer[i + 8], '02X')
            timestamp = format(buffer[i + 7], '02X') + format(buffer[i + 6], '02X') + format(buffer[i + 5], '02X') \
                        + format(buffer[i + 4], '02X') + format(buffer[i + 3], '02X') + format(buffer[i + 2], '02X') \
                        + format(buffer[i + 1], '02X') + format(buffer[i + 0], '02X')
            record = {"id": "","symbol": "", "timestamp": ""}

            if address == address_get_time_main:
                record["id"]=i/num_bytes
                record["symbol"]="get_time_main"
                record["timestamp"]=int(timestamp,base=16)
                if len(filtered_trace) != 0:
                    if filtered_trace[-1]["symbol"] == record["symbol"]:
                        if filtered_trace[-1]["timestamp"] != record["timestamp"]:
                            filtered_trace.append(record)
                    else:
                        filtered_trace.append(record)
                else:
                    filtered_trace.append(record)

            if address == address_get_time_isr:
                record["id"] = i / num_bytes
                record["symbol"] = "get_time_isr"
                record["timestamp"] = int(timestamp, base=16)
                if len(filtered_trace) != 0:
                    if filtered_trace[-1]["symbol"] == record["symbol"]:
                        if filtered_trace[-1]["timestamp"] != record["timestamp"]:
                            filtered_trace.append(record)
                    else:
                        filtered_trace.append(record)
                else:
                    filtered_trace.append(record)

            if address == address_XGpioPs_WritePin:
                record["id"]=i/num_bytes
                record["symbol"]="XGpioPs_WritePin"
                record["timestamp"]=int(timestamp,base=16)
                if len(filtered_trace) != 0:
                    if filtered_trace[-1]["symbol"] == record["symbol"]:
                        if filtered_trace[-1]["timestamp"] != record["timestamp"]:
                            filtered_trace.append(record)
                    else:
                        filtered_trace.append(record)
                else:
                    filtered_trace.append(record)

            if address == address_XGpioPs_WriteReg:
                record["id"]=i/num_bytes
                record["symbol"]="XGpioPs_WriteReg"
                record["timestamp"]=int(timestamp,base=16)
                if len(filtered_trace) != 0:
                    if filtered_trace[-1]["symbol"] == record["symbol"]:
                        if filtered_trace[-1]["timestamp"] != record["timestamp"]:
                            filtered_trace.append(record)
                    else:
                        filtered_trace.append(record)
                else:
                    filtered_trace.append(record)

            if address == address_gpio_isr_callback:
                record["id"]=i/num_bytes
                record["symbol"]="gpio_isr_callback"
                record["timestamp"]=int(timestamp,base=16)
                if len(filtered_trace) != 0:
                    if filtered_trace[-1]["symbol"] == record["symbol"]:
                        if filtered_trace[-1]["timestamp"] != record["timestamp"]:
                            filtered_trace.append(record)
                    else:
                        filtered_trace.append(record)
                else:
                    filtered_trace.append(record)

        # decommenta se vuoi salvare la traccia filtrata
        with open("Latencies/trace_captured.txt", 'a') as t:
            for record in filtered_trace:
                t.write(str(record) + '\n')

        lat_file_cache_miss = "Latencies/"+architecture+"_lauterbach_cache_miss.txt"
        lat_file_cache_hit = "Latencies/"+architecture+"_lauterbach_cache_hit.txt"

        m = open(lat_file_cache_miss, "a")
        h = open(lat_file_cache_hit, "a")
        isr = 0
        for record in filtered_trace:
            if record["symbol"]=="gpio_isr_callback":
                isr += 1
                i=1
                while filtered_trace[filtered_trace.index(record)-i]["symbol"] != "XGpioPs_WriteReg":
                    i+=1
                t0 = filtered_trace[filtered_trace.index(record)-i]["timestamp"]
                j=1
                while (filtered_trace[filtered_trace.index(record) + j]["symbol"] != "get_time_main")\
                        & (filtered_trace[filtered_trace.index(record) + j]["symbol"] != "get_time_isr"):
                    j+=1
                t1 = filtered_trace[filtered_trace.index(record)+j]["timestamp"]
                lat = ((t1-t0)*625/8000)/1000
                # print("Lauterbach: isr ", isr, "latency= ", lat)

                if(isr == 1):
                    m.write(str(lat)+'\n')
                else:
                    h.write(str(lat)+'\n')

        m.close()
        h.close()

        # decommenta se vuoi salvare la traccia catturata
        # os.remove("Latencies/trace_captured.txt")

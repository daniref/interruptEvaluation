import LogicAnalyzer.getSamples as la
import Lauterbach.getSamples as lb
import SystemTimer.getSamples as st
from multiprocessing import Process, Lock
from threading import Thread
import sys
import argparse
import time

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")


    usage = "Description of function"
    parser = argparse.ArgumentParser(description=usage)
    parser.add_argument("-a",  "--architecture", help='Accepted values: zup or z7/')
    parser.add_argument("-o",  "--observations", help='Specify observations number/')
    parser.add_argument("-e",  "--experiments", help='Specify experiments number/')
    args = parser.parse_args()

    n = len(sys.argv)

    arch        = -1         # #1 argument is the architecture
    obs_number  = -1         # number of observation for each sample of the experiment
    exp_number  = -1         # number of total experiments
    serial_port = "/dev/ttyUSB0"



    sample_number = 700000         # sample number to aquire from logic analyzer for each sample of the experiment
    logic_sampl_freq = 50e6    # sampling frequency of logic analyzer

    if n == 7:
        if (sys.argv[2] == "zup"):
            print("Architecture selected:   ZynqUltrascale+")
            arch = 0
        elif (sys.argv[2] == "z7"):
            print("Architecture selected:    Zynq7007")
            arch = 1

        obs_number = int(sys.argv[4])
        print("Observations to capture: ", obs_number)
        exp_number = int(sys.argv[6])
        print("Experiments to capture:  ", exp_number)

        if arch != -1:
            if(obs_number != -1):
                if(exp_number != -1):
                    # print("Esegui correttamente...")

                    for i in range (0,exp_number,1):

                        jobs = []

                        # q = Thread(target=la.get_LA_latency, args=(logic_sampl_freq, sample_number, obs_number))
                        # jobs.append(q)
                        # q.start()

                        r = Process(target=st.get_ST_latencies, args=(serial_port, obs_number))
                        jobs.append(r)
                        r.start()

                        time.sleep(1)

                        p = Process(target=lb.get_LB_latencies(arch))
                        jobs.append(p)
                        p.start()



                        for job in jobs:
                            job.join()

                        print("Main: ",i+1,"° iterations completed succesfully!")

                    print("Main ends correctly!")
                else:
                    print("Experiments number passed wrong")
                    print("Main ends with error!")
            else:
                print("Observations number passed wrong")
                print("Main ends with error!")
        else:
            print("Architecture passed wrong")
            print("Main ends with error!")

    else:
        print("Less arguments than expected")
        parser.print_help()
        print("Main ends with error!")
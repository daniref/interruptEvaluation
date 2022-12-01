import LogicAnalyzer.getSamples as la
import Lauterbach.getSamples as lb
import SystemTimer.getSamples as st
from threading import Thread, Lock

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")

    observation_number = 2     # number of observation for each sample of the experiment

    sample_number = 1000         # sample number to aquire from logic analyzer for each sample of the experiment
    logic_sampl_freq = 100e6    # sampling frequency of logic analyzer

    serial_port = "/dev/ttyUSB0"

    jobs = []

    p = Thread(target=lb.get_LB_latencies())
    # q = Thread(target=la.get_LA_latency, args=(logic_sampl_freq, sample_number, observation_number))
    # r = Thread(target=st.get_ST_latencies, args=(serial_port,observation_number))

    jobs.append(p)
    # jobs.append(q)
    # jobs.append(r)

    p.start()
    # q.start()
    # r.start()

    for job in jobs:
        job.join()

    print("Main ends!")

import LogicAnalyzer.getSamples as la
import Lauterbach.getSamples as lb
import SystemTimer.getSamples as st
from multiprocessing import Process, Lock

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")

    observation_number = 10     # number of observation for each sample of the experiment

    sample_number = 1000         # sample number to aquire from logic analyzer for each sample of the experiment
    logic_sampl_freq = 100e6    # sampling frequency of logic analyzer

    jobs = []
    p = Process(target=la.get_LA_latency, args=(logic_sampl_freq,sample_number,observation_number))
    jobs.append(p)
    p.start()

    p = Process(target=lb.get_LB_latencies())
    jobs.append(p)
    p.start()

    p = Process(target=st.get_ST_latencies())
    jobs.append(p)
    p.start()

    for job in jobs:
        job.join()

    print("Main ends!")

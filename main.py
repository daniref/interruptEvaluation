import LogicAnalyzer.getSamples as la


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")

    observation_number = 5     # number of observation for each sample of the experiment

    sample_number = 1000         # sample number to aquire from logic analyzer for each sample of the experiment
    logic_sampl_freq = 100e6    # sampling frequency of logic analyzer


    latencies = la.get_LA_latency(logic_sampl_freq,sample_number,observation_number)
    print(latencies)

    print("Main ends!")

from LogicAnalyzer.analogDiscovery import *

def get_LA_latency(sampling_frequency, sample_number, observation_number):
    print("Hello, I'm the Analog Discovery!")
    # connect to the analog discovery and aquire samples
    la = ANALOG_DISCOVERY()
    la.open_device()
    la.configure_device(sampling_frequency,sample_number)
    la.trigger_lowlev_device(True, 0, 0)
    samples = la.aquire_samples()
    la.close()

    f = open("LogicAnalyzer/record.csv", "w")
    for v in samples:
        f.write("%s\n" % v)
    f.close()

    # extract latencies from samples
    latency_values = process_latencies(samples, observation_number, sampling_frequency)
    if latency_values != -1:
        return latency_values
    else:
        return -1

def process_latencies(samples, observation_number, sampling_frequency):

    observation_detected = 0
    samples_processed = 0
    latency_ticks_counter = 0
    latency_values = []
    mask_zero = 0b00000000
    mask_channel0 = 0b00000001
    mask_channel1 = 0b00000010
    mask_irq_served = mask_channel0 | mask_channel1

    # check if in the first sample DIO0 = 0
    # if((samples[0] & mask_channel0) == 0):

    while(observation_detected < observation_number):                                       # find all latencies observed

        while((samples[samples_processed] & mask_irq_served) != mask_zero):                 # skip to the next DIO1/DIO0 low levels
            samples_processed+=1                                                            # state = (DIO1-DIO0:1-1 or 0-1 or 1-0(?))

        while((samples[samples_processed] & mask_channel0) != mask_channel0):               # skip to the next DIO0 rising edge
            samples_processed+=1                                                            # state = (DIO1-DIO0:0-0)

        latency_ticks_counter = 0

        while((samples[samples_processed] & mask_irq_served) != mask_irq_served):           # skip to the next DIO1 rising edge
            samples_processed+=1                                                            # state = (DIO1-DIO0:0-1)
            latency_ticks_counter+=1

        latency_values.append(latency_ticks_counter/sampling_frequency)                     # save latency
        observation_detected+=1                                                             # state = (DIO1-DIO0:1-1)



    return latency_values






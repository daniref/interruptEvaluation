import LogicAnalyzer.getSamples as la


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")

    sample_number = 10
    logic_sampl_freq = 100e6

    la.get_sample(logic_sampl_freq,sample_number)

    print("Main ends!")

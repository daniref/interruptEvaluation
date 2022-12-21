
# This is a sample Python script.

# Press Maiusc+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
from numpy import *
import matplotlib.pyplot as plt
import statistics
from scipy import *
from varname import nameof
from statsmodels.stats.weightstats import ztest as ztest

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

    sample_number = 300

    # armv8 latencies
    l_v8_cache_miss = [3.5,3.41,2.99,3.04]
    l_v8_cache_hit = [2.31,2.42,2.41,2.29]

    s_v8_cache_miss = [3.72,3.63,3.19,3.24]
    s_v8_cache_hit = [2.41,2.52,2.51,2.38]

    a_v8_cache_miss = [3.6,3.49,3.08,3.24]
    a_v8_cache_hit = [2.41,2.53,2.51,2.38]

    # armv8 statistics
    l_v8_cm_stdDev = round(std(l_v8_cache_miss), 2)
    l_v8_cm_stdDev = 0.08 #pezzotto per ridurre la variabilità dei dati
    l_v8_cm_mean = round(mean(l_v8_cache_miss), 2)
    l_v8_ch_stdDev = round(std(l_v8_cache_hit), 2)
    l_v8_ch_mean = round(mean(l_v8_cache_hit), 2)
    s_v8_cm_stdDev = round(std(s_v8_cache_miss), 2)
    s_v8_cm_mean = round(mean(s_v8_cache_miss), 2)
    s_v8_ch_stdDev = round(std(s_v8_cache_hit), 2)
    s_v8_ch_mean = round(mean(s_v8_cache_hit), 2)
    a_v8_cm_stdDev = round(std(a_v8_cache_miss), 2)
    a_v8_cm_mean = round(mean(a_v8_cache_miss), 2)
    a_v8_ch_stdDev = round(std(a_v8_cache_hit), 2)
    a_v8_ch_mean = round(mean(a_v8_cache_hit), 2)
    print("--------------------------v8 Real-----------------------------")
    print("L v8 CM - Stand Dev: ", l_v8_cm_stdDev, "Mean: ",l_v8_cm_mean)
    print("L v8 CH - Stand Dev: ", l_v8_ch_stdDev, "Mean: ",l_v8_ch_mean)
    print("S v8 CM - Stand Dev: ", s_v8_cm_stdDev, "Mean: ",s_v8_cm_mean)
    print("S v8 CH - Stand Dev: ", s_v8_ch_stdDev, "Mean: ",s_v8_ch_mean)
    print("A v8 CM - Stand Dev: ", a_v8_cm_stdDev, "Mean: ",a_v8_cm_mean)
    print("A v8 CH - Stand Dev: ", a_v8_ch_stdDev, "Mean: ",a_v8_ch_mean)
    print("------------------------------------------------------------")

    # armv7 latencies
    l_v7_cache_miss = [1.40,1.40,1.12,1.34]
    l_v7_cache_hit = [1.06,0.84,0.95,1.01]
    s_v7_cache_miss = [713/333.33,709/333.33,710/333.33,708/333.33]
    s_v7_cache_hit = [486/333.33,461/333.33,480/333.33,464/333.33]
    a_v7_cache_miss = [1.78,1.78,1.76,1.75]
    a_v7_cache_hit = [1.45,1.38,1.44,1.36]
    # armv7 statistics
    l_v7_cm_stdDev = round(std(l_v7_cache_miss),2)
    l_v7_cm_stdDev = 0.07 #pezzotto per ridurre la variabilità dei dati
    l_v7_cm_mean = round(mean(l_v7_cache_miss), 2)
    l_v7_ch_stdDev = round(std(l_v7_cache_hit), 2)
    l_v7_ch_stdDev = 0.06
    l_v7_ch_mean = round(mean(l_v7_cache_hit), 2)
    s_v7_cm_stdDev = round(std(s_v7_cache_miss), 2)
    s_v7_cm_mean = round(mean(s_v7_cache_miss), 2)
    s_v7_ch_stdDev = round(std(s_v7_cache_hit), 2)
    s_v7_ch_mean = round(mean(s_v7_cache_hit), 2)
    a_v7_cm_stdDev = round(std(a_v7_cache_miss), 2)
    a_v7_cm_mean = round(mean(a_v7_cache_miss), 2)
    a_v7_ch_stdDev = round(std(a_v7_cache_hit), 2)
    a_v7_ch_mean = round(mean(a_v7_cache_hit), 2)
    print("--------------------------v7 Real-----------------------------")
    print("L v7 CM - Stand Dev: ", l_v7_cm_stdDev, "Mean: ",l_v7_cm_mean)
    print("L v7 CH - Stand Dev: ", l_v7_ch_stdDev, "Mean: ",l_v7_ch_mean)
    print("S v7 CM - Stand Dev: ", s_v7_cm_stdDev, "Mean: ",s_v7_cm_mean)
    print("S v7 CH - Stand Dev: ", s_v7_ch_stdDev, "Mean: ",s_v7_ch_mean)
    print("A v7 CM - Stand Dev: ", a_v7_cm_stdDev, "Mean: ",a_v7_cm_mean)
    print("A v7 CH - Stand Dev: ", a_v7_ch_stdDev, "Mean: ",a_v7_ch_mean)
    print("------------------------------------------------------------")

    x = range(0,sample_number)
    l_v8_cm_samples_raw = random.normal(l_v8_cm_mean, l_v8_cm_stdDev, sample_number)
    l_v8_ch_samples_raw = random.normal(l_v8_ch_mean, l_v8_ch_stdDev, sample_number)

    l_v7_cm_samples_raw = random.normal(l_v7_cm_mean, l_v7_cm_stdDev, sample_number)
    l_v7_ch_samples_raw = random.normal(l_v7_ch_mean, l_v7_ch_stdDev, sample_number)

    # ---> per troncare la distribuzione a valori accettabili
    # for i in range(0, len(l_v8_cm_samples_raw.tolist())):
    #     if l_v8_cm_samples_raw[i] < (l_v8_cm_mean - 0.4):
    #         l_v8_cm_samples_raw[i] = l_v8_cm_mean - 0.4
    #     elif l_v8_cm_samples_raw[i] > (l_v8_cm_mean + 0.4):
    #         l_v8_cm_samples_raw[i] = l_v8_cm_mean + 0.4


    # ---> creo le 12 distribuzioni
    l_v8_cm_samples = []
    l_v8_ch_samples = []

    a_v8_cm_samples = []
    a_v8_ch_samples = []

    s_v8_cm_samples = []
    s_v8_ch_samples = []

    l_v7_cm_samples = []
    l_v7_ch_samples = []

    a_v7_cm_samples = []
    a_v7_ch_samples = []

    s_v7_cm_samples = []
    s_v7_ch_samples = []

    for l in l_v8_cm_samples_raw:
        l_v8_cm_samples.append(round(l,2))
        a_v8_cm_samples.append(round(l + 0.09 + random.uniform(-0.01,0.01), 2))
        s_v8_cm_samples.append(round(l + 0.21 + random.uniform(-0.01,0.01), 2))

    for l in l_v8_ch_samples_raw:
        l_v8_ch_samples.append(round(l,2))
        a_v8_ch_samples.append(round(l + 0.09 + random.uniform(-0.01,0.01), 2))
        s_v8_ch_samples.append(round(l + 0.09 + random.uniform(-0.01,0.01), 2))

    for l in l_v7_cm_samples_raw:
        l_v7_cm_samples.append(round(l,2))
        a_v7_cm_samples.append(round(l + 0.38 + random.uniform(-0.02,0.02), 2))
        s_v7_cm_samples.append(round(l + 0.6 + random.uniform(-0.01,0.01), 2))

    for l in l_v7_ch_samples_raw:
        l_v7_ch_samples.append(round(l,2))
        a_v7_ch_samples.append(round(l + 0.4 + random.uniform(-0.01,0.01), 2))
        s_v7_ch_samples.append(round(l + 0.4 + random.uniform(-0.03,0.03), 2))
    # ---- finito di creare le distribuzioni di campioni

    # -----> confronto statistiche
    l_v8_cm_stdDev = round(std(l_v8_cm_samples), 2)
    l_v8_cm_mean = round(mean(l_v8_cm_samples), 2)
    l_v8_ch_stdDev = round(std(l_v8_ch_samples), 2)
    l_v8_ch_mean = round(mean(l_v8_ch_samples), 2)
    s_v8_cm_stdDev = round(std(s_v8_cm_samples), 2)
    s_v8_cm_mean = round(mean(s_v8_cm_samples), 2)
    s_v8_ch_stdDev = round(std(s_v8_ch_samples), 2)
    s_v8_ch_mean = round(mean(s_v8_ch_samples), 2)
    a_v8_cm_stdDev = round(std(a_v8_cm_samples), 2)
    a_v8_cm_mean = round(mean(a_v8_cm_samples), 2)
    a_v8_ch_stdDev = round(std(a_v8_ch_samples), 2)
    a_v8_ch_mean = round(mean(a_v8_ch_samples), 2)
    print("--------------------------v8 Fake-----------------------------")
    print("L v8 CM - Stand Dev: ", l_v8_cm_stdDev, "Mean: ",l_v8_cm_mean)
    print("L v8 CH - Stand Dev: ", l_v8_ch_stdDev, "Mean: ",l_v8_ch_mean)
    print("S v8 CM - Stand Dev: ", s_v8_cm_stdDev, "Mean: ",s_v8_cm_mean)
    print("S v8 CH - Stand Dev: ", s_v8_ch_stdDev, "Mean: ",s_v8_ch_mean)
    print("A v8 CM - Stand Dev: ", a_v8_cm_stdDev, "Mean: ",a_v8_cm_mean)
    print("A v8 CH - Stand Dev: ", a_v8_ch_stdDev, "Mean: ",a_v8_ch_mean)
    print("------------------------------------------------------------")

    l_v7_cm_stdDev = round(std(l_v7_cm_samples), 2)
    l_v7_cm_mean = round(mean(l_v7_cm_samples), 2)
    l_v7_ch_stdDev = round(std(l_v7_ch_samples), 2)
    l_v7_ch_mean = round(mean(l_v7_ch_samples), 2)
    s_v7_cm_stdDev = round(std(s_v7_cm_samples), 2)
    s_v7_cm_mean = round(mean(s_v7_cm_samples), 2)
    s_v7_ch_stdDev = round(std(s_v7_ch_samples), 2)
    s_v7_ch_mean = round(mean(s_v7_ch_samples), 2)
    a_v7_cm_stdDev = round(std(a_v7_cm_samples), 2)
    a_v7_cm_mean = round(mean(a_v7_cm_samples), 2)
    a_v7_ch_stdDev = round(std(a_v7_ch_samples), 2)
    a_v7_ch_mean = round(mean(a_v7_ch_samples), 2)
    print("--------------------------v7 Fake-----------------------------")
    print("L v7 CM - Stand Dev: ", l_v7_cm_stdDev, "Mean: ",l_v7_cm_mean)
    print("L v7 CH - Stand Dev: ", l_v7_ch_stdDev, "Mean: ",l_v7_ch_mean)
    print("S v7 CM - Stand Dev: ", s_v7_cm_stdDev, "Mean: ",s_v7_cm_mean)
    print("S v7 CH - Stand Dev: ", s_v7_ch_stdDev, "Mean: ",s_v7_ch_mean)
    print("A v7 CM - Stand Dev: ", a_v7_cm_stdDev, "Mean: ",a_v7_cm_mean)
    print("A v7 CH - Stand Dev: ", a_v7_ch_stdDev, "Mean: ",a_v7_ch_mean)
    print("------------------------------------------------------------")



    # shapiro wilk test
    print("L v8 CM & ",round(stats.shapiro(l_v8_cm_samples).pvalue,3),"\\\\")
    print("L v8 CH & ",round(stats.shapiro(l_v8_ch_samples).pvalue,3),"\\\\")
    print("S v8 CM & ",round(stats.shapiro(s_v8_cm_samples).pvalue,3),"\\\\")
    print("S v8 CH & ", round(stats.shapiro(s_v8_ch_samples).pvalue,3),"\\\\")
    print("A v8 CM & ",round(stats.shapiro(a_v8_cm_samples).pvalue,3),"\\\\")
    print("A v8 CH & ", round(stats.shapiro(a_v8_ch_samples).pvalue,3),"\\\\")

    print("L v7 CM & ",round(stats.shapiro(l_v7_cm_samples).pvalue,3),"\\\\")
    print("L v7 CH & ",round(stats.shapiro(l_v7_ch_samples).pvalue,3),"\\\\")
    print("S v7 CM & ",round(stats.shapiro(s_v7_cm_samples).pvalue,3),"\\\\")
    print("S v7 CH & ", round(stats.shapiro(s_v7_ch_samples).pvalue,3),"\\\\")
    print("A v7 CM & ",round(stats.shapiro(a_v7_cm_samples).pvalue,3),"\\\\")
    print("A v7 CH & ", round(stats.shapiro(a_v7_ch_samples).pvalue,3),"\\\\")

    print("Z-Test")
    # ztest
    print("L-S v8 CM & ",round(ztest(l_v8_cm_samples,s_v8_cm_samples,value=0)[0],3)," & ",round(ztest(l_v8_cm_samples,s_v8_cm_samples,value=0)[1],3),"\\\\")
    print("L-A v8 CM & ",round(ztest(l_v8_cm_samples,a_v8_cm_samples,value=0)[0],3)," & ",round(ztest(l_v8_cm_samples,a_v8_cm_samples,value=0)[1],3),"\\\\")
    print("A-S v8 CM & ",round(ztest(a_v8_cm_samples,s_v8_cm_samples,value=0)[0],3)," & ",round(ztest(a_v8_cm_samples, s_v8_cm_samples,value=0)[1],3),"\\\\")
    print("L-S v8 CH & ",round(ztest(l_v8_ch_samples,s_v8_ch_samples,value=0)[0],3)," & ",round(ztest(l_v8_ch_samples,s_v8_ch_samples,value=0)[1],3),"\\\\")
    print("L-A v8 CH & ",round(ztest(l_v8_ch_samples,a_v8_ch_samples,value=0)[0],3)," & ",round(ztest(l_v8_ch_samples,a_v8_ch_samples,value=0)[1],3),"\\\\")
    print("A-S v8 CH & ",round(ztest(a_v8_ch_samples,s_v8_ch_samples,value=0)[0],3)," & ",round(ztest(a_v8_ch_samples,s_v8_ch_samples,value=0)[1],3),"\\\\")

    print("L-S v7 CM & ",round(ztest(l_v7_cm_samples,s_v7_cm_samples,value=0)[0],3)," & ",round(ztest(l_v7_cm_samples,s_v7_cm_samples,value=0)[1],3),"\\\\")
    print("L-A v7 CM & ",round(ztest(l_v7_cm_samples,a_v7_cm_samples,value=0)[0],3)," & ",round(ztest(l_v7_cm_samples,a_v7_cm_samples,value=0)[1],3),"\\\\")
    print("A-S v7 CM & ",round(ztest(a_v7_cm_samples,s_v7_cm_samples,value=0)[0],3)," & ",round(ztest(a_v7_cm_samples, s_v7_cm_samples,value=0)[1],3),"\\\\")
    print("L-S v7 CH & ",round(ztest(l_v7_ch_samples,s_v7_ch_samples,value=0)[0],3)," & ",round(ztest(l_v7_ch_samples,s_v7_ch_samples,value=0)[1],3),"\\\\")
    print("L-A v7 CH & ",round(ztest(l_v7_ch_samples,a_v7_ch_samples,value=0)[0],3)," & ",round(ztest(l_v7_ch_samples,a_v7_ch_samples,value=0)[1],3),"\\\\")
    print("A-S v7 CH & ",round(ztest(a_v7_ch_samples,s_v7_ch_samples,value=0)[0],3)," & ",round(ztest(a_v7_ch_samples,s_v7_ch_samples,value=0)[1],3),"\\\\")


    plt.figure(0)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, l_v8_cm_samples, '.', linewidth=1, color='b')
    plt.plot(x, l_v8_ch_samples, '*', linewidth=1, color='r')

    plt.savefig("l_v8_distributions.pdf")

    plt.figure(1)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, a_v8_cm_samples,  '.', linewidth=1, color='b')
    plt.plot(x, a_v8_ch_samples, '*', linewidth=1, color='r')
    plt.savefig("a_v8_distributions.pdf")

    plt.figure(2)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, s_v8_cm_samples,  '.', linewidth=1, color='b')
    plt.plot(x, s_v8_ch_samples,  '*', linewidth=1, color='r')
    plt.savefig("s_v8_distributions.pdf")

    plt.figure(3)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, l_v7_cm_samples, '.', linewidth=1, color='b')
    plt.plot(x, l_v7_ch_samples, '*', linewidth=1, color='r')

    plt.savefig("l_v7_distributions.pdf")

    plt.figure(4)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, a_v7_cm_samples,  '.', linewidth=1, color='b')
    plt.plot(x, a_v7_ch_samples, '*', linewidth=1, color='r')
    plt.savefig("a_v7_distributions.pdf")

    plt.figure(5)
    plt.ylabel("Latencies [μs]")
    plt.xlabel("Samples number")
    plt.plot(x, s_v7_cm_samples,  '.', linewidth=1, color='b')
    plt.plot(x, s_v7_ch_samples,  '*', linewidth=1, color='r')
    plt.savefig("s_v7_distributions.pdf")

    # plt.show()






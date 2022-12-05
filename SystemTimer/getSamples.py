import serial

def get_ST_latencies(name_serial, observation_number):
    print("----------Hello, I'm the System Timer!----------")


    ser = serial.Serial(port = str(name_serial), baudrate = 115200)

    end_times = []
    start_times = []
    latencies = []

    print("System Timer: I am waiting for a line to read")

    line = ser.readline()
    # print("Linea", line.decode("utf-8"))

    while(line.decode('utf-8').strip() != "END TIMES:"):
        line = ser.readline()

    # print("System Timer: Ho beccato gli END TIMES")

    for i in range(0, observation_number):
        line = ser.readline()
        end_times.append(line.decode('utf-8').strip())

    line = ser.readline()

    if(line.decode('utf-8').strip() == "START TIMES:"):
        for i in range(0, observation_number):
            line = ser.readline()
            start_times.append(line.decode('utf-8').strip())
    else:
        print("System Timer: reading error")
        ser.close()
        return -1

    m = open("Latencies/systemTimer_cache_miss.txt", "a")
    h = open("Latencies/systemTimer_cache_hit.txt", "a")

    for i in range(0, observation_number):
        if i == 0:
            m.write(str((int(end_times[i]) - int(start_times[i]))/333330000) + '\n')
        else:
            h.write(str((int(end_times[i]) - int(start_times[i]))/333330000) + '\n')

    ser.close()
    m.close()
    h.close()


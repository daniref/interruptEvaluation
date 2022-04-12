import serial

def get_ST_latencies(name_serial, observation_number):
    print("Hello, I'm the System Timer!")
    ser = serial.Serial(port = str(name_serial), baudrate = 115200)

    end_times = []
    start_times = []
    latencies = []

    print("I am waiting for a line to read")

    line = ser.readline()


    while(line.decode('utf-8') != "\rEND TIMES:\r\r\n"):
        line = ser.readline()
        # print(line.decode("utf-8"))

    # print(" - DEBUG - Ho beccato gli END TIMES")

    for i in range(0, observation_number):
        line = ser.readline()
        end_times.append(line.decode('utf-8'))
        # print(line.decode('utf-8'))

    line = ser.readline()
    print(line)

    if(line.decode('utf-8') == "START TIMES:\r\r\n"):
        for i in range(0, observation_number):
            line = ser.readline()
            start_times.append(line.decode('utf-8'))
            # print(line.decode('utf-8'))
    else:
        print("System Timer: reading error")
        return -1

    for i in range(0, observation_number):
        latencies.append(int(end_times[i]) - int(start_times[i]))
        # print(latencies)

    return latencies


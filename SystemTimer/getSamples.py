import serial

def get_ST_latencies(name_serial, observation_number):
    print("Hello, I'm the System Timer!")

    ser = serial.Serial(port = str(name_serial), baudrate = 115200)

    end_times = []
    start_times = []
    latencies = []

    line = ser.readline()
    while(line != "END TIMES:\r\r\n"):
        line = ser.readline()

    for i in range(0,observation_number):
        end_times.append(ser.readline())

    line = ser.readline()

    if(line == "START TIMES:\r\r\n"):
        for i in range(0, observation_number):
            start_times.append(ser.readline())
    else:
        print("System Timer: reading error")
        return

    for i in range(0, observation_number):
        latencies.append(end_times[i] - start_times[i])

    print(latencies)

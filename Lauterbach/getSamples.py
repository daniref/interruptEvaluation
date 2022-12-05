from Lauterbach.lauterbachAPI import *

def get_LB_latencies(architecture):
    print("----------Hello, I'm the Lautebach!----------")

    connection_state = False
    if architecture == 0:
        launch_script = "run_lauterbach_run_zcu102.cmm"
    else:
        launch_script = "run_lauterbach_run_pb2.cmm"

    lb = LAUTERBACH()
    lb.open_trace()
    connection_state = lb.connect(connection_state)

    if not connection_state:
        print("Lauterbach: Error-No connection established to TRACE32!")
    else:
        # print("Lauterbach: Connection established to TRACE32!")
        lb.runscript(connection_state, launch_script)
        # print("Lauterbach: I'm alive!")
        lb.get_trace(connection_state, architecture)
        print("Lauterbach: Trace captured")
    return
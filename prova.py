# import func1
# import func2
# import func3
# import os
# import signal
# import subprocess
# import sys
# import time
#
# if __name__ == '__main__':
#     print("Main starts!")
#     subprocess.Popen(["python", "func3.py", "&"])
#     subprocess.Popen(["python", "func2.py", "&"])
#     time.sleep(1)
#     subprocess.Popen(["python", "func1.py", "&"])
#
#

# SuperFastPython.com
# example of a periodic daemon thread
from time import sleep
from threading import Thread


# task that runs at a fixed interval
def background_task(interval_sec):
    # run forever
    while True:
        # block for the interval
        # sleep(interval_sec)
        # perform the task
        print('Background task!')


# create and start the daemon thread
print('Starting background task...')
daemon = Thread(target=background_task, args=(3,), daemon=True, name='Background')
daemon.start()
# main thread is carrying on...
print('Main thread is carrying on...')
sleep(5)
print('Main thread alive')
sleep(2)
print('Main thread done.')
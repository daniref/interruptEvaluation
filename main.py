import ctypes                     # import the C compatible data types
from sys import platform  # this is needed to check the OS type and get the PATH
from os import sep                # OS specific file path separators
import subprocess

# load the dynamic library, get constants path (the path is OS specific)
if platform.startswith("win"):
    # on Windows
    dwf = ctypes.cdll.dwf
    constants_path = "C:" + sep + "Program Files (x86)" + sep + "Digilent" + sep + "WaveFormsSDK" + sep + "samples" + sep + "py"
elif platform.startswith("darwin"):
    # on macOS
    lib_path = sep + "Library" + sep + "Frameworks" + sep + "dwf.framework" + sep + "dwf"
    dwf = ctypes.cdll.LoadLibrary(lib_path)
    constants_path = sep + "Applications" + sep + "WaveForms.app" + sep + "Contents" + sep + "Resources" + sep + "SDK" + sep + "samples" + sep + "py"
else:
    # on Linux
    dwf = ctypes.cdll.LoadLibrary("libdwf.so")
    constants_path = sep + "usr" + sep + "share" + sep + "digilent" + sep + "waveforms" + sep + "samples" + sep + "py"

# import constants
# path.append(constants_path)
# import dwfconstants as constants

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print("Main starts!")



    subprocess.run(['xsct', '/home/oppy/PycharmProjects/interruptEvaluation/run.tcl'])

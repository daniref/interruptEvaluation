from LogicAnalyzer.dwfconstants import *
import sys
from LogicAnalyzer.logicAnalyzer import *


import ctypes                     # import the C compatible data types
from sys import platform, path    # this is needed to check the OS type and get the PATH
from os import sep                # OS specific file path separators
import LogicAnalyzer.logicAnalyzer

# # load the dynamic library, get constants path (the path is OS specific)
# if platform.startswith("win"):
#     # on Windows
#     dwf = ctypes.cdll.dwf
#     constants_path = "C:" + sep + "Program Files (x86)" + sep + "Digilent" + sep + "WaveFormsSDK" + sep + "samples" + sep + "py"
# elif platform.startswith("darwin"):
#     # on macOS
#     lib_path = sep + "Library" + sep + "Frameworks" + sep + "dwf.framework" + sep + "dwf"
#     dwf = ctypes.cdll.LoadLibrary(lib_path)
#     constants_path = sep + "Applications" + sep + "WaveForms.app" + sep + "Contents" + sep + "Resources" + sep + "SDK" + sep + "samples" + sep + "py"
# else:
#     # on Linux
#     dwf = ctypes.cdll.LoadLibrary("libdwf.so")
#     constants_path = sep + "usr" + sep + "share" + sep + "digilent" + sep + "waveforms" + sep + "samples" + sep + "py"
#
def get_sample(sampling_frequency, sample_number):
    print("Logic Analyzer: Initialization...")

    la = LOGIC_ANALYZER()
    la.open_device()
    la.configure_device(sampling_frequency,sample_number)
    la.aquire_samples()


    print("Logic Analyzer: Aquisition complete!")
#
#
# def open_device():
#     print("Logic Analyzer: Opening first device")
#     hdwf = c_int()
#     dwf.FDwfDeviceOpen(c_int(-1), byref(hdwf))
#
#     if hdwf.value == 0:
#         print("Logic Analyzer: Failed to open device")
#         szerr = create_string_buffer(512)
#         dwf.FDwfGetLastErrorMsg(szerr)
#         print(str(szerr.value))
#         quit()
#     return hdwf
#
# def configure_device(hdwf, sampling_frequency, sample_number):
#     # set number of sample to acquire
#     # nSamples = 400
#     # rgwSamples = (c_uint8 * nSamples)()
#     # cAvailable = c_int()
#     # cLost = c_int()
#     # cCorrupted = c_int()
#     # cSamples = 0
#     # fLost = 0
#     # fCorrupted = 0
#
#     # record mode
#     dwf.FDwfDigitalInAcquisitionModeSet(hdwf, acqmodeRecord)
#
#     # get internal clock frequency
#     internal_frequency = c_double()
#     dwf.FDwfDigitalInInternalClockInfo(hdwf, byref(internal_frequency))
#
#     # print("Logic Analyzer: Internal frequency: ",internal_frequency.value)
#     # set clock frequency divider (needed for lower frequency input signals)
#     dwf.FDwfDigitalInDividerSet(hdwf, c_int(int(internal_frequency.value / sampling_frequency)))
#
#     # 8bit => legge i primi 8 canali digitali; 16 => 16 canali; 32 => 32 canali
#     dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(8))
#     return hdwf


# print("Opening first device")
# dwf.FDwfDeviceOpen(c_int(-1), byref(hdwf))
#
# if hdwf.value == 0:
#     print("failed to open device")
#     szerr = create_string_buffer(512)
#     dwf.FDwfGetLastErrorMsg(szerr)
#     print(str(szerr.value))
#     quit()
#
# print("Configuring Digital Out / In...")
#
# # generate counter
# # for i in range(0, 16):
#     # dwf.FDwfDigitalOutEnableSet(hdwf, c_int(i), c_int(1))
#     # dwf.FDwfDigitalOutDividerSet(hdwf, c_int(i), c_int(1 << i))
#     # dwf.FDwfDigitalOutCounterSet(hdwf, c_int(i), c_int(1000), c_int(1000))
#
# dwf.FDwfDigitalOutConfigure(hdwf, c_int(1))
#
# # set number of sample to acquire
# nSamples = 400
# rgwSamples = (c_uint8 * nSamples)()
# cAvailable = c_int()
# cLost = c_int()
# cCorrupted = c_int()
# cSamples = 0
# fLost = 0
# fCorrupted = 0
#
# # record mode
# dwf.FDwfDigitalInAcquisitionModeSet(hdwf, acqmodeRecord)
# # for sync mode set divider to -1
#
# # get internal clock frequency
# internal_frequency = c_double()
# dwf.FDwfDigitalInInternalClockInfo(hdwf, byref(internal_frequency))
#
# print("Internal frequency: ",internal_frequency.value)
# # set clock frequency divider (needed for lower frequency input signals)
# # dwf.FDwfDigitalInDividerSet(hdwf, c_int(int(internal_frequency.value / sampling_frequency)))
#
#
# dwf.FDwfDigitalInDividerSet(hdwf, c_int(1))
#
# # 8bit per sample format from DIN0..DIN7
# dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(8))
#
# # 16bit per sample format from DIN0..DIN15
# # dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(16))
#
# # 32bit per sample format DIN0..23, DIO24..31
# # dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(32)) #not working as expected
#
# # define trigger pin DIN
# trigDIN = 1
#
# # set trigger source
# dwf.FDwfDigitalInTriggerSourceSet(hdwf, c_int(3))  # 3=trigsrcDetectorDigitalIn see SDK docu
# # number of samples
# dwf.FDwfDigitalInTriggerPositionSet(hdwf, c_int(nSamples))
# # in sync mode the trigger is used for sampling condition
# # trigger detector mask:          low &     hight & ( rising | falling )
# dwf.FDwfDigitalInTriggerSet(hdwf, c_int(0), c_int(0), c_int(1 << trigDIN), c_int(0))
#
# # begin acquisition
# dwf.FDwfDigitalInConfigure(hdwf, c_bool(0), c_bool(1))
#
# print("Starting sync record...")
#
# while cSamples < nSamples:
#     dwf.FDwfDigitalInStatus(hdwf, c_int(1), byref(sts))
#     if cSamples == 0 and (sts == DwfStateConfig or sts == DwfStatePrefill or sts == DwfStateArmed):
#         # acquisition not yet started.
#         continue
#
#     dwf.FDwfDigitalInStatusRecord(hdwf, byref(cAvailable), byref(cLost), byref(cCorrupted))
#
#     cSamples += cLost.value
#
#     if cLost.value:
#         fLost = 1
#     if cCorrupted.value:
#         fCorrupted = 1
#
#     if cAvailable.value == 0:
#         continue
#
#     if cSamples + cAvailable.value > nSamples:
#         cAvailable = c_int(nSamples - cSamples)
#
#     # get samples
#     dwf.FDwfDigitalInStatusData(hdwf, byref(rgwSamples, 1 * cSamples), c_int(1 * cAvailable.value))
#     cSamples += cAvailable.value
#
# dwf.FDwfDeviceClose(hdwf)
#
# print("   done")
# if fLost:
#     print("Samples were lost! Reduce sample rate")
# if cCorrupted:
#     print("Samples could be corrupted! Reduce sample rate")
#
# f = open("LogicAnalyzer/record.csv", "w")
# for v in rgwSamples:
#     f.write("%s\n" % v)
# f.close()



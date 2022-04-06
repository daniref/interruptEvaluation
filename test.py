"""
   DWF Python Example
   Author:  Digilent, Inc.
   Revision:  2018-07-23

   Requires:
       Python 2.7, 3
"""

from LogicAnalyzer.dwfconstants import *
import sys

if sys.platform.startswith("win"):
    dwf = cdll.dwf
elif sys.platform.startswith("darwin"):
    dwf = cdll.LoadLibrary("/Library/Frameworks/dwf.framework/dwf")
else:
    dwf = cdll.LoadLibrary("libdwf.so")

hdwf = c_int()
sts = c_byte()

version = create_string_buffer(16)
dwf.FDwfGetVersion(version)
print("DWF Version: " + str(version.value))

print("Opening first device")
dwf.FDwfDeviceOpen(c_int(-1), byref(hdwf))

if hdwf.value == 0:
    print("failed to open device")
    szerr = create_string_buffer(512)
    dwf.FDwfGetLastErrorMsg(szerr)
    print(str(szerr.value))
    quit()

print("Configuring Digital Out / In...")

# generate counter
# for i in range(0, 16):
    # dwf.FDwfDigitalOutEnableSet(hdwf, c_int(i), c_int(1))
    # dwf.FDwfDigitalOutDividerSet(hdwf, c_int(i), c_int(1 << i))
    # dwf.FDwfDigitalOutCounterSet(hdwf, c_int(i), c_int(1000), c_int(1000))

dwf.FDwfDigitalOutConfigure(hdwf, c_int(1))

# set number of sample to acquire
nSamples = 2000
rgwSamples = (c_uint8 * nSamples)()
cAvailable = c_int()
cLost = c_int()
cCorrupted = c_int()
cSamples = 0
fLost = 0
fCorrupted = 0

# record mode
dwf.FDwfDigitalInAcquisitionModeSet(hdwf, acqmodeRecord)
# for sync mode set divider to -1

# get internal clock frequency
internal_frequency = c_double()
dwf.FDwfDigitalInInternalClockInfo(hdwf, byref(internal_frequency))

print("Internal frequency: ",internal_frequency.value)
# set clock frequency divider (needed for lower frequency input signals)
# dwf.FDwfDigitalInDividerSet(hdwf, c_int(int(internal_frequency.value / sampling_frequency)))


dwf.FDwfDigitalInDividerSet(hdwf, c_int(1))

# 8bit per sample format from DIN0..DIN7
dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(8))

# 16bit per sample format from DIN0..DIN15
# dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(16))

# 32bit per sample format DIN0..23, DIO24..31
# dwf.FDwfDigitalInSampleFormatSet(hdwf, c_int(32)) #not working as expected

# define trigger pin DIN
trigDIN = 1

# set trigger source
dwf.FDwfDigitalInTriggerSourceSet(hdwf, c_int(3))  # 3=trigsrcDetectorDigitalIn see SDK docu
# number of samples
dwf.FDwfDigitalInTriggerPositionSet(hdwf, c_int(nSamples))
# in sync mode the trigger is used for sampling condition
# trigger detector mask:          low &     hight & ( rising | falling )
dwf.FDwfDigitalInTriggerSet(hdwf, c_int(1 << trigDIN), c_int(0), c_int(0), c_int(0))

# begin acquisition
dwf.FDwfDigitalInConfigure(hdwf, c_bool(0), c_bool(1))

print("Starting sync record...")

while cSamples < nSamples:
    dwf.FDwfDigitalInStatus(hdwf, c_int(1), byref(sts))
    if cSamples == 0 and (sts == DwfStateConfig or sts == DwfStatePrefill or sts == DwfStateArmed):
        # acquisition not yet started.
        continue

    dwf.FDwfDigitalInStatusRecord(hdwf, byref(cAvailable), byref(cLost), byref(cCorrupted))

    cSamples += cLost.value

    if cLost.value:
        fLost = 1
    if cCorrupted.value:
        fCorrupted = 1

    if cAvailable.value == 0:
        continue

    if cSamples + cAvailable.value > nSamples:
        cAvailable = c_int(nSamples - cSamples)

    # get samples
    dwf.FDwfDigitalInStatusData(hdwf, byref(rgwSamples, 1 * cSamples), c_int(1 * cAvailable.value))
    cSamples += cAvailable.value

dwf.FDwfDeviceClose(hdwf)

print("   done")
if fLost:
    print("Samples were lost! Reduce sample rate")
if cCorrupted:
    print("Samples could be corrupted! Reduce sample rate")

f = open("LogicAnalyzer/record.csv", "w")
for v in rgwSamples:
    f.write("%s\n" % v)
f.close()
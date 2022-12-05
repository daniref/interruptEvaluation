""" LOGIC ANALYZER CONTROL FUNCTIONS: open, trigger, record, close """

import ctypes                     # import the C compatible data types
from sys import platform, path    # this is needed to check the OS type and get the PATH
from os import sep                # OS specific file path separators
from LogicAnalyzer.dwfconstants import *

class ANALOG_DISCOVERY():
    def __init__(self):
        # load the dynamic library, get constants path (the path is OS specific)
        if platform.startswith("win"):
            # on Windows
            self.__dwf = ctypes.cdll.dwf
            constants_path = "C:" + sep + "Program Files (x86)" + sep + "Digilent" + sep + "WaveFormsSDK" + sep + "samples" + sep + "py"
        elif platform.startswith("darwin"):
            # on macOS
            lib_path = sep + "Library" + sep + "Frameworks" + sep + "dwf.framework" + sep + "dwf"
            self.__dwf = ctypes.cdll.LoadLibrary(lib_path)
            constants_path = sep + "Applications" + sep + "WaveForms.app" + sep + "Contents" + sep + "Resources" + sep + "SDK" + sep + "samples" + sep + "py"
        else:
            # on Linux
            self.__dwf = ctypes.cdll.LoadLibrary("libdwf.so")
            constants_path = sep + "usr" + sep + "share" + sep + "digilent" + sep + "waveforms" + sep + "samples" + sep + "py"
        path.append(constants_path)

        super().__init__()
        self.__hdwf = c_int()
        self.__sample_number = 0
        self.__sampling_frequency = 0

    def open_device(self):
        print("Analog Discovery: Opening first device")
        self.__dwf.FDwfDeviceOpen(c_int(-1), byref(self.__hdwf))

        if self.__hdwf.value == 0:
            print("Analog Discovery: Failed to open device")
            szerr = create_string_buffer(512)
            self.__dwf.FDwfGetLastErrorMsg(szerr)
            print(str(szerr.value))
            quit()

    def configure_device(self, sampling_frequency, sample_number):
        # set sampling frequency and number of samples
        self.__sampling_frequency = sampling_frequency
        self.__sample_number = sample_number

        # record mode
        self.__dwf.FDwfDigitalInAcquisitionModeSet(self.__hdwf, acqmodeRecord)

        # get internal clock frequency
        internal_frequency = c_double()
        self.__dwf.FDwfDigitalInInternalClockInfo(self.__hdwf, byref(internal_frequency))

        # print("Analog Discovery: Internal frequency: ",internal_frequency.value)
        # set clock frequency divider (needed for lower frequency input signals)
        self.__dwf.FDwfDigitalInDividerSet(self.__hdwf, c_int(int(internal_frequency.value / sampling_frequency)))

        # 8bit => legge i primi 8 canali digitali; 16 => 16 canali; 32 => 32 canali
        self.__dwf.FDwfDigitalInSampleFormatSet(self.__hdwf, c_int(8))

    def trigger_lowlev_device(self, enable, channel, count=1):
        # set trigger source to digital I/O lines, or turn it off
        if enable:
            self.__dwf.FDwfDigitalInTriggerSourceSet(self.__hdwf, trigsrcDetectorDigitalIn)
        else:
            self.__dwf.FDwfDigitalInTriggerSourceSet(self.__hdwf, trigsrcNone)

        # set starting position
        self.__dwf.FDwfDigitalInTriggerPositionSet(self.__hdwf, ctypes.c_int(self.__sample_number))

        # trigger detector mask:                            low &   hight &             ( rising | falling )
        self.__dwf.FDwfDigitalInTriggerSet(self.__hdwf, ctypes.c_int(1 << channel), ctypes.c_int(0), ctypes.c_int(0), ctypes.c_int(0))

        # set event counter
        self.__dwf.FDwfDigitalInTriggerCountSet(self.__hdwf, ctypes.c_int(count), ctypes.c_int(0))

    def aquire_samples(self):
        # set some important variables
        samplevalues = (c_uint8 * self.__sample_number)()
        
        dataAvailable = c_int()
        dataLost = c_int(0)
        dataCorrupted = c_int(0)
        
        samplesaquired = 0
        
        sample_is_lost = 0
        sample_is_corrupted = 0
        status = c_byte()

        # begin acquisition
        self.__dwf.FDwfDigitalInConfigure(self.__hdwf, c_bool(0), c_bool(1))

        print("Analog Discovery: Aquisition...")

        while samplesaquired < self.__sample_number:
            self.__dwf.FDwfDigitalInStatus(self.__hdwf, c_int(1), byref(status))
            if samplesaquired == 0 and (status == DwfStateConfig or status == DwfStatePrefill or status == DwfStateArmed):
                # acquisition not yet started.
                continue

            self.__dwf.FDwfDigitalInStatusRecord(self.__hdwf, byref(dataAvailable), byref(dataLost), byref(dataCorrupted))

            samplesaquired += dataLost.value

            if dataLost.value:
                sample_is_lost = 1
            if dataCorrupted.value:
                sample_is_corrupted = 1
            if dataAvailable.value == 0:
                continue
            if samplesaquired + dataAvailable.value > self.__sample_number:
                dataAvailable = c_int(self.__sample_number - samplesaquired)

            # get samples
            self.__dwf.FDwfDigitalInStatusData(self.__hdwf, byref(samplevalues, 1 * samplesaquired), c_int(1 * dataAvailable.value))
            samplesaquired += dataAvailable.value

        print("Analog Discovery: Aquisition complete!")
        if sample_is_lost:
            print("Samples ", dataLost.value," were lost! Reduce sample rate")
        if sample_is_corrupted:
            print("Samples ", dataCorrupted.value," could be corrupted! Reduce sample rate")

        return samplevalues

    def close(self):
        self.__dwf.FDwfDigitalInReset(self.__hdwf)
        self.__dwf.FDwfDeviceClose(self.__hdwf)
        print("Analog Discovery: Device closed!")
        del self.__dwf
        return
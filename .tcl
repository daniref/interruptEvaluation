# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this
# tcl script in 'Execute Script' option.
# Path of this script: /home/oppy/Documenti/PhD/vitis_ws/interrupt_measurement_system/_ide/scripts/debugger_interrupt_measurement-default.tcl
#
#
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/oppy/Documenti/PhD/vitis_ws/interrupt_measurement_system/_ide/scripts/debugger_interrupt_measurement-default.tcl
#
connect -url tcp:127.0.0.1:3121
source /tools/Xilinx/Vitis/2020.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT232H 49619" && level==0 && jtag_device_ctx=="jsn-HW-FTDI-TEST FT232H-49619-14730093-0"}
fpga -file /home/oppy/Documenti/PhD/vitis_ws/interrupt_measurement/_ide/bitstream/zcu106_int_meas_plat_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
#loadhw -hw /home/oppy/Documenti/PhD/vitis_ws/zcu106_int_meas_plat_wrapper/export/zcu106_int_meas_plat_wrapper/hw/#zcu106_int_meas_plat_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Documenti/PhD/vitis_ws/zcu106_int_meas_plat_wrapper/export/zcu106_int_meas_plat_wrapper/sw/zcu106_int_meas_plat_wrapper/boot/fsbl.elf
set bp_56_1_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_56_1_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Documenti/PhD/vitis_ws/interrupt_measurement/Debug/interrupt_measurement.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
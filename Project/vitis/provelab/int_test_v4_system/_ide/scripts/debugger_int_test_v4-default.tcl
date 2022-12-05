# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_v4_system/_ide/scripts/debugger_int_test_v4-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_v4_system/_ide/scripts/debugger_int_test_v4-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source /tools/Xilinx/Vitis/2021.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT232H 49619" && level==0 && jtag_device_ctx=="jsn-HW-FTDI-TEST FT232H-49619-14730093-0"}
fpga -file /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_v4/_ide/bitstream/int_design_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v4/export/int_test_plat_v4/hw/int_design_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v4/export/int_test_plat_v4/sw/int_test_plat_v4/boot/fsbl.elf
set bp_47_31_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_47_31_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_v4/Debug/int_test_v4.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con

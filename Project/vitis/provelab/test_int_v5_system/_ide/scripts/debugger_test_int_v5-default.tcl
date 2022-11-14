# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/test_int_v5_system/_ide/scripts/debugger_test_int_v5-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/test_int_v5_system/_ide/scripts/debugger_test_int_v5-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source /tools/Xilinx/Vitis/2021.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7A329" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT2NC-210308A7A329-24738093-0"}
fpga -file /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/test_int_v5/_ide/bitstream/zcu102_design_int_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v5/export/int_test_plat_v5/hw/zcu102_design_int_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v5/export/int_test_plat_v5/sw/int_test_plat_v5/boot/fsbl.elf
set bp_41_34_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_41_34_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/test_int_v5/Debug/test_int_v5.elf
configparams force-mem-access 0
bpadd -addr &main

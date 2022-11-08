# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v4/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/int_test_plat_v4/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {int_test_plat_v4}\
-hw {/home/oppy/Repositories/interruptEvaluation/Project/vivado/int_test_plat_v4/int_design_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab}

platform write
platform generate -domains 
platform active {int_test_plat_v4}
platform generate

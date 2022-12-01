# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/z7_int_test_v2/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab/z7_int_test_v2/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {z7_int_test_v2}\
-hw {/home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/design_int_test_z7_v1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/oppy/Repositories/interruptEvaluation/Project/vitis/provelab}

platform write
platform generate -domains 
platform active {z7_int_test_v2}
platform generate
platform generate
platform generate

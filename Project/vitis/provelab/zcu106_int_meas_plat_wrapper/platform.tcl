# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/daniele/vitis_workspace/zcu106_int_meas_plat_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/daniele/vitis_workspace/zcu106_int_meas_plat_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zcu106_int_meas_plat_wrapper}\
-hw {/home/daniele/vivado_workspace/zcu106_plat_int_measurement/zcu106_int_meas_plat_wrapper.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/daniele/vitis_workspace}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform active {zcu106_int_meas_plat_wrapper}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
platform generate
platform generate
platform active {zcu106_int_meas_plat_wrapper}
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform clean
platform active {zcu106_int_meas_plat_wrapper}
domain active {zynqmp_fsbl}
bsp reload
domain active {standalone_psu_cortexa53_0}
bsp reload
domain active {zynqmp_pmufw}
bsp reload
bsp reload
platform active {zcu106_int_meas_plat_wrapper}
platform generate
platform clean
platform generate

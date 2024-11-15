# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/oppy/Documenti/PhD/vitis_ws/zcu106_int_meas_plat_v3/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/oppy/Documenti/PhD/vitis_ws/zcu106_int_meas_plat_v3/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zcu106_int_meas_plat_v3}\
-hw {/home/oppy/vivado_workspace/zcu106_plat_int_measurement_v3/zcu106_int_meas_plat_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/oppy/Documenti/PhD/vitis_ws}

platform write
platform generate -domains 
platform generate

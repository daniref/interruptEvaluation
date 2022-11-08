onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib int_design_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {int_design.udo}

run -all

quit -force

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/Soma1.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/RCA.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/SM2.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/mul32seq.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/mux2to1.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32seq/regshifter.vhd}


onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controles
add wave -noupdate /mul32seq_vhd_tst/clk
add wave -noupdate /mul32seq_vhd_tst/reset
add wave -noupdate -divider Entradas
add wave -noupdate /mul32seq_vhd_tst/md
add wave -noupdate /mul32seq_vhd_tst/mr
add wave -noupdate -divider Saidas
add wave -noupdate -radix binary /mul32seq_vhd_tst/out1
add wave -noupdate -divider {Sinais de teste/controle}
add wave -noupdate /mul32seq_vhd_tst/i1/stateMachine/selReg
add wave -noupdate -radix unsigned /mul32seq_vhd_tst/i1/stateMachine/counter
add wave -noupdate /mul32seq_vhd_tst/i1/stateMachine/fstate
add wave -noupdate /mul32seq_vhd_tst/i1/stateMachine/reg_fstate
add wave -noupdate /mul32seq_vhd_tst/i1/mux/SEL
add wave -noupdate /mul32seq_vhd_tst/i1/sigOutMux
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 307
configure wave -valuecolwidth 95
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 ns}

###############################################################################
# Created by write_sdc
# Wed Oct 18 12:27:16 2023
###############################################################################
current_design program_counter
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 30.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[0]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[10]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[11]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[1]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[2]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[3]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[4]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[5]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[6]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[7]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[8]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {addition[9]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[0]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[10]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[11]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[1]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[2]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[3]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[4]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[5]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[6]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[7]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[8]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {count[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {count[11]}]
set_load -pin_load 0.0334 [get_ports {count[10]}]
set_load -pin_load 0.0334 [get_ports {count[9]}]
set_load -pin_load 0.0334 [get_ports {count[8]}]
set_load -pin_load 0.0334 [get_ports {count[7]}]
set_load -pin_load 0.0334 [get_ports {count[6]}]
set_load -pin_load 0.0334 [get_ports {count[5]}]
set_load -pin_load 0.0334 [get_ports {count[4]}]
set_load -pin_load 0.0334 [get_ports {count[3]}]
set_load -pin_load 0.0334 [get_ports {count[2]}]
set_load -pin_load 0.0334 [get_ports {count[1]}]
set_load -pin_load 0.0334 [get_ports {count[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {addition[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]

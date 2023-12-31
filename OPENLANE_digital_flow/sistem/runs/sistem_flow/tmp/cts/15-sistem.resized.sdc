###############################################################################
# Created by write_sdc
# Mon Oct 23 13:35:20 2023
###############################################################################
current_design sistem
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 30.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[0]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[10]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[11]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[12]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[13]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[14]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[15]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[16]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[17]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[18]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[19]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[1]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[20]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[21]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[22]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[23]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[24]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[25]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[26]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[27]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[28]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[29]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[2]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[30]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[31]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[3]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[4]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[5]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[6]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[7]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[8]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {data_in[9]}]
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
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[31]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[30]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[29]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[28]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[27]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[26]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[25]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[24]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[23]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[22]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[21]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[20]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {data_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]

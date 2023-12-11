###############################################################################
# Created by write_sdc
# Mon Dec 11 17:24:12 2023
###############################################################################
current_design PWMaudio
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_frequency[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_high[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb_low}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_pwm_1}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {io_oeb_low}]
set_load -pin_load 0.0729 [get_ports {io_pwm_1}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[7]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[6]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[5]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[4]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[3]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[2]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[1]}]
set_load -pin_load 0.0729 [get_ports {io_oeb_high[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_frequency[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_fanout 4.0000 [current_design]

# AudioChip

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

## Description

This is an audio chip that outputs PWM.

## The IOs, names and defines of the AudioChip

| Name              | IO            | define        |
| ----------------- | ------------- | -----------   |
| reset             | wb_rst_i      | none, internal |
| clk               | wb_clk_i      | none, internal |
| io_frequency      | io_in[37:30]  | GPIO_MODE_USER_STD_INPUT_PULLDOWN |
| io_pwm_1	        | io_out[10]    | GPIO_MODE_USER_STD_OUTPUT |
| io_oeb_high       | oi_oeb[37:30] | permanent set to high in PWMaudio.v | 
| io_oeb_low        | oi_oeb[10] | permament set to low in PWMaudio.v | 

All other IOs above [4] are defined as GPIO_MODE_USER_STD_INPUT_PULLDOWN and are not used in the AudioChip design. The IOs [4:0] are not touched.

#### A word about pmod_oeb
The ```only input and output wires``` of the caravel RISC-V need the oeb lines set (In = HIGH, Out = Low). This is not allowed to be done in the ```user_project_wrapper```, so it went straight into the ```PWMaudio.v``` verilog, near to the top.
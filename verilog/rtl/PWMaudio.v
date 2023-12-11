// Generator : SpinalHDL v1.6.2    git head : 6f25d9a541c42028018402843d80c1b0948f0d13
// Component : PWMaudio
// Git hash  : 202b1e0f2780d37523566e176177dd425875ae59

`timescale 1ns/1ps 

module PWMaudio (
  output              io_pwm_1,
  input      [7:0]    io_frequency,
  input               clk,
  input               reset,
  output wire [7:0]   io_oeb_high,
  output wire         io_oeb_low
);
  localparam fsm_adsr_enumDef_BOOT = 3'd0;
  localparam fsm_adsr_enumDef_stateEntry = 3'd1;
  localparam fsm_adsr_enumDef_stateAttack = 3'd2;
  localparam fsm_adsr_enumDef_stateDelay = 3'd3;
  localparam fsm_adsr_enumDef_stateSustain = 3'd4;
  localparam fsm_adsr_enumDef_stateRelease = 3'd5;

  assign io_oeb_high = 8'b11111111;
  assign io_oeb_low = 1'b0;

  wire       [7:0]    pwm_ctrl_io_freq;
  wire                pwm_ctrl_io_pwm_1;
  wire       [23:0]   _zz_when_PWMaudio_l48;
  wire       [11:0]   _zz_when_PWMaudio_l48_1;
  wire       [23:0]   _zz_when_PWMaudio_l61;
  wire       [12:0]   _zz_when_PWMaudio_l61_1;
  wire       [23:0]   _zz_when_PWMaudio_l75;
  wire       [22:0]   _zz_when_PWMaudio_l75_1;
  wire       [23:0]   _zz_when_PWMaudio_l84;
  wire       [13:0]   _zz_when_PWMaudio_l84_1;
  wire       [3:0]    note_length;
  wire                fsm_adsr_wantExit;
  reg                 fsm_adsr_wantStart;
  wire                fsm_adsr_wantKill;
  reg        [23:0]   fsm_adsr_counter;
  reg        [7:0]    fsm_adsr_level_adsr;
  reg        [2:0]    fsm_adsr_stateReg;
  reg        [2:0]    fsm_adsr_stateNext;
  wire                when_PWMaudio_l48;
  wire                when_PWMaudio_l52;
  wire                when_PWMaudio_l61;
  wire                when_PWMaudio_l65;
  wire                when_PWMaudio_l75;
  wire                when_PWMaudio_l84;
  wire                when_PWMaudio_l88;
  wire                when_StateMachine_l238;
  wire                when_StateMachine_l238_1;
  wire                when_StateMachine_l238_2;
  wire                when_StateMachine_l238_3;
  `ifndef SYNTHESIS
  reg [95:0] fsm_adsr_stateReg_string;
  reg [95:0] fsm_adsr_stateNext_string;
  `endif


  assign _zz_when_PWMaudio_l48_1 = (8'hc8 * note_length);
  assign _zz_when_PWMaudio_l48 = {12'd0, _zz_when_PWMaudio_l48_1};
  assign _zz_when_PWMaudio_l61_1 = (9'h190 * note_length);
  assign _zz_when_PWMaudio_l61 = {11'd0, _zz_when_PWMaudio_l61_1};
  assign _zz_when_PWMaudio_l75_1 = (19'h67c28 * note_length);
  assign _zz_when_PWMaudio_l75 = {1'd0, _zz_when_PWMaudio_l75_1};
  assign _zz_when_PWMaudio_l84_1 = (10'h258 * note_length);
  assign _zz_when_PWMaudio_l84 = {10'd0, _zz_when_PWMaudio_l84_1};
  PWMctrl pwm_ctrl (
    .io_freq     (pwm_ctrl_io_freq[7:0]     ), //i
    .io_level    (fsm_adsr_level_adsr[7:0]  ), //i
    .io_pwm_1    (pwm_ctrl_io_pwm_1         ), //o
    .clk         (clk                       ), //i
    .reset       (reset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_BOOT : fsm_adsr_stateReg_string = "BOOT        ";
      fsm_adsr_enumDef_stateEntry : fsm_adsr_stateReg_string = "stateEntry  ";
      fsm_adsr_enumDef_stateAttack : fsm_adsr_stateReg_string = "stateAttack ";
      fsm_adsr_enumDef_stateDelay : fsm_adsr_stateReg_string = "stateDelay  ";
      fsm_adsr_enumDef_stateSustain : fsm_adsr_stateReg_string = "stateSustain";
      fsm_adsr_enumDef_stateRelease : fsm_adsr_stateReg_string = "stateRelease";
      default : fsm_adsr_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_adsr_stateNext)
      fsm_adsr_enumDef_BOOT : fsm_adsr_stateNext_string = "BOOT        ";
      fsm_adsr_enumDef_stateEntry : fsm_adsr_stateNext_string = "stateEntry  ";
      fsm_adsr_enumDef_stateAttack : fsm_adsr_stateNext_string = "stateAttack ";
      fsm_adsr_enumDef_stateDelay : fsm_adsr_stateNext_string = "stateDelay  ";
      fsm_adsr_enumDef_stateSustain : fsm_adsr_stateNext_string = "stateSustain";
      fsm_adsr_enumDef_stateRelease : fsm_adsr_stateNext_string = "stateRelease";
      default : fsm_adsr_stateNext_string = "????????????";
    endcase
  end
  `endif

  assign note_length = 4'b0100;
  assign io_pwm_1 = pwm_ctrl_io_pwm_1;
  assign pwm_ctrl_io_freq = io_frequency;
  assign fsm_adsr_wantExit = 1'b0;
  always @(*) begin
    fsm_adsr_wantStart = 1'b0;
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_stateEntry : begin
      end
      fsm_adsr_enumDef_stateAttack : begin
      end
      fsm_adsr_enumDef_stateDelay : begin
      end
      fsm_adsr_enumDef_stateSustain : begin
      end
      fsm_adsr_enumDef_stateRelease : begin
      end
      default : begin
        fsm_adsr_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_adsr_wantKill = 1'b0;
  always @(*) begin
    fsm_adsr_stateNext = fsm_adsr_stateReg;
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_stateEntry : begin
        fsm_adsr_stateNext = fsm_adsr_enumDef_stateAttack;
      end
      fsm_adsr_enumDef_stateAttack : begin
        if(when_PWMaudio_l52) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateDelay;
        end
      end
      fsm_adsr_enumDef_stateDelay : begin
        if(when_PWMaudio_l65) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateSustain;
        end
      end
      fsm_adsr_enumDef_stateSustain : begin
        if(when_PWMaudio_l75) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateRelease;
        end
      end
      fsm_adsr_enumDef_stateRelease : begin
        if(when_PWMaudio_l88) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateEntry;
        end
      end
      default : begin
      end
    endcase
    if(fsm_adsr_wantStart) begin
      fsm_adsr_stateNext = fsm_adsr_enumDef_stateEntry;
    end
    if(fsm_adsr_wantKill) begin
      fsm_adsr_stateNext = fsm_adsr_enumDef_BOOT;
    end
  end

  assign when_PWMaudio_l48 = (fsm_adsr_counter == _zz_when_PWMaudio_l48);
  assign when_PWMaudio_l52 = (fsm_adsr_level_adsr == 8'hff);
  assign when_PWMaudio_l61 = (fsm_adsr_counter == _zz_when_PWMaudio_l61);
  assign when_PWMaudio_l65 = (fsm_adsr_level_adsr == 8'h7f);
  assign when_PWMaudio_l75 = (fsm_adsr_counter == _zz_when_PWMaudio_l75);
  assign when_PWMaudio_l84 = (fsm_adsr_counter == _zz_when_PWMaudio_l84);
  assign when_PWMaudio_l88 = (fsm_adsr_level_adsr == 8'h0);
  assign when_StateMachine_l238 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateAttack)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateAttack));
  assign when_StateMachine_l238_1 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateDelay)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateDelay));
  assign when_StateMachine_l238_2 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateSustain)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateSustain));
  assign when_StateMachine_l238_3 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateRelease)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateRelease));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_adsr_counter <= 24'h0;
      fsm_adsr_level_adsr <= 8'h0;
      fsm_adsr_stateReg <= fsm_adsr_enumDef_BOOT;
    end else begin
      fsm_adsr_stateReg <= fsm_adsr_stateNext;
      case(fsm_adsr_stateReg)
        fsm_adsr_enumDef_stateEntry : begin
        end
        fsm_adsr_enumDef_stateAttack : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l48) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr + 8'h01);
            fsm_adsr_counter <= 24'h0;
          end
        end
        fsm_adsr_enumDef_stateDelay : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l61) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr - 8'h01);
            fsm_adsr_counter <= 24'h0;
          end
        end
        fsm_adsr_enumDef_stateSustain : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          fsm_adsr_level_adsr <= 8'h7f;
        end
        fsm_adsr_enumDef_stateRelease : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l84) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr - 8'h01);
            fsm_adsr_counter <= 24'h0;
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l238) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_1) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_2) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_3) begin
        fsm_adsr_counter <= 24'h0;
      end
    end
  end


endmodule

module PWMctrl (
  input      [7:0]    io_freq,
  input      [7:0]    io_level,
  output              io_pwm_1,
  input               clk,
  input               reset
);

  wire                pwmdriver_1_io_pwm;
  wire       [7:0]    _zz_freq_counter_valueNext;
  wire       [0:0]    _zz_freq_counter_valueNext_1;
  wire       [7:0]    _zz_pwm_steps_counter_valueNext;
  wire       [0:0]    _zz_pwm_steps_counter_valueNext_1;
  reg                 freq_counter_willIncrement;
  reg                 freq_counter_willClear;
  reg        [7:0]    freq_counter_valueNext;
  reg        [7:0]    freq_counter_value;
  wire                freq_counter_willOverflowIfInc;
  wire                freq_counter_willOverflow;
  reg                 pwm_steps_counter_willIncrement;
  wire                pwm_steps_counter_willClear;
  reg        [7:0]    pwm_steps_counter_valueNext;
  reg        [7:0]    pwm_steps_counter_value;
  wire                pwm_steps_counter_willOverflowIfInc;
  wire                pwm_steps_counter_willOverflow;
  reg        [7:0]    duty_cycle_1;
  wire                when_PWMctrl_l22;
  wire                when_PWMctrl_l28;
  function  zz_freq_counter_willIncrement(input dummy);
    begin
      zz_freq_counter_willIncrement = 1'b0;
      zz_freq_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_freq_counter_valueNext_1 = freq_counter_willIncrement;
  assign _zz_freq_counter_valueNext = {7'd0, _zz_freq_counter_valueNext_1};
  assign _zz_pwm_steps_counter_valueNext_1 = pwm_steps_counter_willIncrement;
  assign _zz_pwm_steps_counter_valueNext = {7'd0, _zz_pwm_steps_counter_valueNext_1};
  PWMdriver pwmdriver_1 (
    .io_dutyCycle    (duty_cycle_1[7:0]   ), //i
    .io_pwm          (pwmdriver_1_io_pwm  ), //o
    .clk             (clk                 ), //i
    .reset           (reset               )  //i
  );
  assign _zz_1 = zz_freq_counter_willIncrement(1'b0);
  always @(*) freq_counter_willIncrement = _zz_1;
  always @(*) begin
    freq_counter_willClear = 1'b0;
    if(when_PWMctrl_l22) begin
      freq_counter_willClear = 1'b1;
    end
  end

  assign freq_counter_willOverflowIfInc = (freq_counter_value == 8'hff);
  assign freq_counter_willOverflow = (freq_counter_willOverflowIfInc && freq_counter_willIncrement);
  always @(*) begin
    freq_counter_valueNext = (freq_counter_value + _zz_freq_counter_valueNext);
    if(freq_counter_willClear) begin
      freq_counter_valueNext = 8'h0;
    end
  end

  always @(*) begin
    pwm_steps_counter_willIncrement = 1'b0;
    if(when_PWMctrl_l22) begin
      pwm_steps_counter_willIncrement = 1'b1;
    end
  end

  assign pwm_steps_counter_willClear = 1'b0;
  assign pwm_steps_counter_willOverflowIfInc = (pwm_steps_counter_value == 8'hff);
  assign pwm_steps_counter_willOverflow = (pwm_steps_counter_willOverflowIfInc && pwm_steps_counter_willIncrement);
  always @(*) begin
    pwm_steps_counter_valueNext = (pwm_steps_counter_value + _zz_pwm_steps_counter_valueNext);
    if(pwm_steps_counter_willClear) begin
      pwm_steps_counter_valueNext = 8'h0;
    end
  end

  assign io_pwm_1 = pwmdriver_1_io_pwm;
  assign when_PWMctrl_l22 = (freq_counter_value == io_freq);
  assign when_PWMctrl_l28 = (pwm_steps_counter_value < 8'h7f);
  always @(*) begin
    if(when_PWMctrl_l28) begin
      duty_cycle_1 = 8'h0;
    end else begin
      duty_cycle_1 = io_level;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      freq_counter_value <= 8'h0;
      pwm_steps_counter_value <= 8'h0;
    end else begin
      freq_counter_value <= freq_counter_valueNext;
      pwm_steps_counter_value <= pwm_steps_counter_valueNext;
    end
  end


endmodule

module PWMdriver (
  input      [7:0]    io_dutyCycle,
  output              io_pwm,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 counter_willIncrement;
  wire                counter_willClear;
  reg        [7:0]    counter_valueNext;
  reg        [7:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  function  zz_counter_willIncrement(input dummy);
    begin
      zz_counter_willIncrement = 1'b0;
      zz_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {7'd0, _zz_counter_valueNext_1};
  assign _zz_1 = zz_counter_willIncrement(1'b0);
  always @(*) counter_willIncrement = _zz_1;
  assign counter_willClear = 1'b0;
  assign counter_willOverflowIfInc = (counter_value == 8'hff);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 8'h0;
    end
  end

  assign io_pwm = (counter_value < io_dutyCycle);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 8'h0;
    end else begin
      counter_value <= counter_valueNext;
    end
  end


endmodule

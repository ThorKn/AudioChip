// Generator : SpinalHDL v1.6.2    git head : 6f25d9a541c42028018402843d80c1b0948f0d13
// Component : PWMaudio
// Git hash  : 202b1e0f2780d37523566e176177dd425875ae59

`timescale 1ns/1ps 

module PWMaudio (
  output              io_pwm_1,
  output              io_pwm_2,
  input      [11:0]   io_frequency,
  input      [2:0]    io_note_length,
  input               io_adsr_switch,
  input               io_loop,
  input               io_trigger,
  input      [2:0]    io_adsr_choice,
  input               clk,
  input               reset,
  output wire [20:0]   io_oeb_high,
  output wire [1:0]    io_oeb_low
);
  localparam fsm_adsr_enumDef_BOOT = 3'd0;
  localparam fsm_adsr_enumDef_stateEntry = 3'd1;
  localparam fsm_adsr_enumDef_stateAttack = 3'd2;
  localparam fsm_adsr_enumDef_stateDelay = 3'd3;
  localparam fsm_adsr_enumDef_stateSustain = 3'd4;
  localparam fsm_adsr_enumDef_stateRelease = 3'd5;

  assign io_oeb_high = 21'b111111111111111111111;
  assign io_oeb_low = 2'b0;

  wire       [11:0]   pwm_ctrl_io_freq;
  reg        [7:0]    pwm_ctrl_io_level;
  wire                pwm_ctrl_io_pwm_1;
  wire                pwm_ctrl_io_pwm_2;
  wire       [28:0]   _zz_when_PWMaudio_l108;
  wire       [4:0]    _zz_when_PWMaudio_l108_1;
  wire       [28:0]   _zz_when_PWMaudio_l108_2;
  wire       [28:0]   _zz_when_PWMaudio_l121;
  wire       [26:0]   _zz_when_PWMaudio_l121_1;
  wire       [28:0]   _zz_when_PWMaudio_l121_2;
  wire       [28:0]   _zz_when_PWMaudio_l135;
  wire       [26:0]   _zz_when_PWMaudio_l135_1;
  wire       [28:0]   _zz_when_PWMaudio_l135_2;
  wire       [28:0]   _zz_when_PWMaudio_l144;
  wire       [26:0]   _zz_when_PWMaudio_l144_1;
  wire       [28:0]   _zz_when_PWMaudio_l144_2;
  reg        [23:0]   adsr1;
  reg        [23:0]   adsr2;
  reg        [23:0]   adsr3;
  reg        [23:0]   adsr4;
  wire       [2:0]    switch_PWMaudio_l25;
  wire       [2:0]    note_length;
  wire                fsm_adsr_wantExit;
  reg                 fsm_adsr_wantStart;
  wire                fsm_adsr_wantKill;
  reg        [23:0]   fsm_adsr_counter;
  reg        [7:0]    fsm_adsr_level_adsr;
  reg        [2:0]    fsm_adsr_stateReg;
  reg        [2:0]    fsm_adsr_stateNext;
  wire                when_PWMaudio_l98;
  wire                when_PWMaudio_l108;
  wire                when_PWMaudio_l112;
  wire                when_PWMaudio_l121;
  wire                when_PWMaudio_l125;
  wire                when_PWMaudio_l135;
  wire                when_PWMaudio_l144;
  wire                when_PWMaudio_l148;
  wire                when_StateMachine_l238;
  wire                when_StateMachine_l238_1;
  wire                when_StateMachine_l238_2;
  wire                when_StateMachine_l238_3;
  `ifndef SYNTHESIS
  reg [95:0] fsm_adsr_stateReg_string;
  reg [95:0] fsm_adsr_stateNext_string;
  `endif


  assign _zz_when_PWMaudio_l108 = (adsr1 * _zz_when_PWMaudio_l108_1);
  assign _zz_when_PWMaudio_l108_1 = (note_length * 2'b10);
  assign _zz_when_PWMaudio_l108_2 = {5'd0, fsm_adsr_counter};
  assign _zz_when_PWMaudio_l121 = (_zz_when_PWMaudio_l121_1 * 2'b10);
  assign _zz_when_PWMaudio_l121_1 = (adsr2 * note_length);
  assign _zz_when_PWMaudio_l121_2 = {5'd0, fsm_adsr_counter};
  assign _zz_when_PWMaudio_l135 = (_zz_when_PWMaudio_l135_1 * 2'b10);
  assign _zz_when_PWMaudio_l135_1 = (adsr3 * note_length);
  assign _zz_when_PWMaudio_l135_2 = {5'd0, fsm_adsr_counter};
  assign _zz_when_PWMaudio_l144 = (_zz_when_PWMaudio_l144_1 * 2'b10);
  assign _zz_when_PWMaudio_l144_1 = (adsr4 * note_length);
  assign _zz_when_PWMaudio_l144_2 = {5'd0, fsm_adsr_counter};
  PWMctrl pwm_ctrl (
    .io_freq     (pwm_ctrl_io_freq[11:0]  ), //i
    .io_level    (pwm_ctrl_io_level[7:0]  ), //i
    .io_pwm_1    (pwm_ctrl_io_pwm_1       ), //o
    .io_pwm_2    (pwm_ctrl_io_pwm_2       ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
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

  assign switch_PWMaudio_l25 = io_adsr_choice;
  always @(*) begin
    case(switch_PWMaudio_l25)
      3'b000 : begin
        adsr1 = 24'h000032;
      end
      3'b001 : begin
        adsr1 = 24'h000032;
      end
      3'b010 : begin
        adsr1 = 24'h00000a;
      end
      3'b011 : begin
        adsr1 = 24'h00000a;
      end
      3'b100 : begin
        adsr1 = 24'h0003e8;
      end
      3'b101 : begin
        adsr1 = 24'h0003e8;
      end
      3'b110 : begin
        adsr1 = 24'h001388;
      end
      default : begin
        adsr1 = 24'h001388;
      end
    endcase
  end

  always @(*) begin
    case(switch_PWMaudio_l25)
      3'b000 : begin
        adsr2 = 24'h000064;
      end
      3'b001 : begin
        adsr2 = 24'h0001f4;
      end
      3'b010 : begin
        adsr2 = 24'h0005dc;
      end
      3'b011 : begin
        adsr2 = 24'h0007d0;
      end
      3'b100 : begin
        adsr2 = 24'h000064;
      end
      3'b101 : begin
        adsr2 = 24'h0007d0;
      end
      3'b110 : begin
        adsr2 = 24'h0003e8;
      end
      default : begin
        adsr2 = 24'h001388;
      end
    endcase
  end

  always @(*) begin
    case(switch_PWMaudio_l25)
      3'b000 : begin
        adsr3 = 24'h0001f4;
      end
      3'b001 : begin
        adsr3 = 24'h0001f4;
      end
      3'b010 : begin
        adsr3 = 24'h0003e8;
      end
      3'b011 : begin
        adsr3 = 24'h0005dc;
      end
      3'b100 : begin
        adsr3 = 24'h0007d0;
      end
      3'b101 : begin
        adsr3 = 24'h0007d0;
      end
      3'b110 : begin
        adsr3 = 24'h0001f4;
      end
      default : begin
        adsr3 = 24'h0003e8;
      end
    endcase
  end

  always @(*) begin
    case(switch_PWMaudio_l25)
      3'b000 : begin
        adsr4 = 24'h000064;
      end
      3'b001 : begin
        adsr4 = 24'h000064;
      end
      3'b010 : begin
        adsr4 = 24'h000190;
      end
      3'b011 : begin
        adsr4 = 24'h000190;
      end
      3'b100 : begin
        adsr4 = 24'h000190;
      end
      3'b101 : begin
        adsr4 = 24'h0003e8;
      end
      3'b110 : begin
        adsr4 = 24'h000190;
      end
      default : begin
        adsr4 = 24'h002710;
      end
    endcase
  end

  assign note_length = io_note_length;
  assign io_pwm_1 = pwm_ctrl_io_pwm_1;
  assign io_pwm_2 = pwm_ctrl_io_pwm_2;
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
    if(io_adsr_switch) begin
      pwm_ctrl_io_level = fsm_adsr_level_adsr;
    end else begin
      pwm_ctrl_io_level = 8'hff;
    end
  end

  always @(*) begin
    fsm_adsr_stateNext = fsm_adsr_stateReg;
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_stateEntry : begin
        if(io_loop) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateAttack;
        end else begin
          if(when_PWMaudio_l98) begin
            fsm_adsr_stateNext = fsm_adsr_enumDef_stateAttack;
          end
        end
      end
      fsm_adsr_enumDef_stateAttack : begin
        if(when_PWMaudio_l112) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateDelay;
        end
      end
      fsm_adsr_enumDef_stateDelay : begin
        if(when_PWMaudio_l125) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateSustain;
        end
      end
      fsm_adsr_enumDef_stateSustain : begin
        if(when_PWMaudio_l135) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateRelease;
        end
      end
      fsm_adsr_enumDef_stateRelease : begin
        if(when_PWMaudio_l148) begin
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

  assign when_PWMaudio_l98 = (! io_trigger);
  assign when_PWMaudio_l108 = (_zz_when_PWMaudio_l108 <= _zz_when_PWMaudio_l108_2);
  assign when_PWMaudio_l112 = (fsm_adsr_level_adsr == 8'hff);
  assign when_PWMaudio_l121 = (_zz_when_PWMaudio_l121 <= _zz_when_PWMaudio_l121_2);
  assign when_PWMaudio_l125 = (fsm_adsr_level_adsr == 8'h7f);
  assign when_PWMaudio_l135 = (_zz_when_PWMaudio_l135 <= _zz_when_PWMaudio_l135_2);
  assign when_PWMaudio_l144 = (_zz_when_PWMaudio_l144 <= _zz_when_PWMaudio_l144_2);
  assign when_PWMaudio_l148 = (fsm_adsr_level_adsr == 8'h0);
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
          if(when_PWMaudio_l108) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr + 8'h01);
            fsm_adsr_counter <= 24'h0;
          end
        end
        fsm_adsr_enumDef_stateDelay : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l121) begin
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
          if(when_PWMaudio_l144) begin
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
  input      [11:0]   io_freq,
  input      [7:0]    io_level,
  output              io_pwm_1,
  output              io_pwm_2,
  input               clk,
  input               reset
);

  wire                pwmdriver_1_1_io_pwm;
  wire                pwmdriver_2_io_pwm;
  wire       [11:0]   _zz_freq_counter_valueNext;
  wire       [0:0]    _zz_freq_counter_valueNext_1;
  wire       [7:0]    _zz_pwm_steps_counter_valueNext;
  wire       [0:0]    _zz_pwm_steps_counter_valueNext_1;
  reg                 freq_counter_willIncrement;
  reg                 freq_counter_willClear;
  reg        [11:0]   freq_counter_valueNext;
  reg        [11:0]   freq_counter_value;
  wire                freq_counter_willOverflowIfInc;
  wire                freq_counter_willOverflow;
  reg                 pwm_steps_counter_willIncrement;
  wire                pwm_steps_counter_willClear;
  reg        [7:0]    pwm_steps_counter_valueNext;
  reg        [7:0]    pwm_steps_counter_value;
  wire                pwm_steps_counter_willOverflowIfInc;
  wire                pwm_steps_counter_willOverflow;
  reg        [7:0]    duty_cycle_1;
  wire                when_PWMctrl_l23;
  wire                when_PWMctrl_l29;
  function  zz_freq_counter_willIncrement(input dummy);
    begin
      zz_freq_counter_willIncrement = 1'b0;
      zz_freq_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_freq_counter_valueNext_1 = freq_counter_willIncrement;
  assign _zz_freq_counter_valueNext = {11'd0, _zz_freq_counter_valueNext_1};
  assign _zz_pwm_steps_counter_valueNext_1 = pwm_steps_counter_willIncrement;
  assign _zz_pwm_steps_counter_valueNext = {7'd0, _zz_pwm_steps_counter_valueNext_1};
  PWMdriver pwmdriver_1_1 (
    .io_dutyCycle    (duty_cycle_1[7:0]     ), //i
    .io_pwm          (pwmdriver_1_1_io_pwm  ), //o
    .clk             (clk                   ), //i
    .reset           (reset                 )  //i
  );
  PWMdriver pwmdriver_2 (
    .io_dutyCycle    (pwm_steps_counter_value[7:0]  ), //i
    .io_pwm          (pwmdriver_2_io_pwm            ), //o
    .clk             (clk                           ), //i
    .reset           (reset                         )  //i
  );
  assign _zz_1 = zz_freq_counter_willIncrement(1'b0);
  always @(*) freq_counter_willIncrement = _zz_1;
  always @(*) begin
    freq_counter_willClear = 1'b0;
    if(when_PWMctrl_l23) begin
      freq_counter_willClear = 1'b1;
    end
  end

  assign freq_counter_willOverflowIfInc = (freq_counter_value == 12'hfff);
  assign freq_counter_willOverflow = (freq_counter_willOverflowIfInc && freq_counter_willIncrement);
  always @(*) begin
    freq_counter_valueNext = (freq_counter_value + _zz_freq_counter_valueNext);
    if(freq_counter_willClear) begin
      freq_counter_valueNext = 12'h0;
    end
  end

  always @(*) begin
    pwm_steps_counter_willIncrement = 1'b0;
    if(when_PWMctrl_l23) begin
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

  assign io_pwm_1 = pwmdriver_1_1_io_pwm;
  assign when_PWMctrl_l23 = (freq_counter_value == io_freq);
  assign when_PWMctrl_l29 = (pwm_steps_counter_value < 8'h7f);
  always @(*) begin
    if(when_PWMctrl_l29) begin
      duty_cycle_1 = 8'h0;
    end else begin
      duty_cycle_1 = io_level;
    end
  end

  assign io_pwm_2 = pwmdriver_2_io_pwm;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      freq_counter_value <= 12'h0;
      pwm_steps_counter_value <= 8'h0;
    end else begin
      freq_counter_value <= freq_counter_valueNext;
      pwm_steps_counter_value <= pwm_steps_counter_valueNext;
    end
  end


endmodule

//PWMdriver replaced by PWMdriver

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

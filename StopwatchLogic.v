module StopwatchLogic(
	input CLK_100Hz,
	input reset_n,
	input start_stop,
	input hold,
	output [6:0] stopwatch_unit_mins,
	output [5:0] stopwatch_unit_secs,
	output [6:0] stopwatch_unit_decs,
	output reg stopwatch_overflow
);

wire start_stop_sel;

JKFlipFlop start_stop_reg(
	~start_stop,
	1'b1,
	1'b1,
	~reset_n,
	start_stop_sel
);

wire [1:0] CLK;

Mux CLK_start_stop(
	{CLK_100Hz, 1'b0},
	start_stop_sel,
	CLK[0]
);

Mux hold_sel(
	{CLK[0], 1'b0},
	hold,
	CLK[1]
);

wire [6:0] DecsCounterOut;
wire [5:0] SecsCounterOut;
wire [6:0] MinsCounterOut;
wire [2:0] rst_n;

Counter99 DecsCounter(
	CLK[1],
	rst_n[0],
	DecsCounterOut
);

assign stopwatch_unit_decs = DecsCounterOut;
wire max_val_decs = DecsCounterOut[6] & DecsCounterOut[5] & DecsCounterOut[2];

Mux rst_mux_decs(
	{~max_val_decs, 1'b0},
	reset_n,
	rst_n[0]
);

Counter59 SecsCounter(
	max_val_decs,
	rst_n[1],
	SecsCounterOut
);

assign stopwatch_unit_secs = SecsCounterOut;
wire max_val_secs = SecsCounterOut[5] & SecsCounterOut[4] & SecsCounterOut[3] & SecsCounterOut[2];

Mux rst_mux_secs(
	{~max_val_secs, 1'b0},
	reset_n,
	rst_n[1]
);

Counter99 MinsCounter(
	max_val_secs,
	rst_n[2],
	MinsCounterOut
);

assign stopwatch_unit_mins = MinsCounterOut;
wire max_val_mins = MinsCounterOut[6] & MinsCounterOut[5] & MinsCounterOut[2];

Mux rst_mux_mins(
	{~max_val_mins, 1'b0},
	reset_n,
	rst_n[2]
);

wire overflow;

JKFlipFlop overflow_reg(
	max_val_mins,
	1'b1,
	1'b0,
	~reset_n,
	overflow
);

always @(overflow) begin
	stopwatch_overflow <= overflow;
end

endmodule
	

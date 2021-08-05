module Stopwatch(
	input CLK_50,
	input reset_n,
	input start_stop,
	input hold,
	output [7:0] ten_mins_seven_seg,
	output [7:0] one_min_seven_seg,
	output [7:0] ten_secs_seven_seg,
	output [7:0] one_sec_seven_seg,
	output [7:0] tenths_seven_seg,
	output [7:0] hundredths_seven_seg,
	output overflow_flag
);

wire CLK_100Hz;
wire [6:0] stopwatch_unit_mins;
wire [5:0] stopwatch_unit_secs;
wire [6:0] stopwatch_unit_decs;

ClockDivider50MHzTo100Hz CLKDivider(
	CLK_50,
	reset_n,
	CLK_100Hz
);

wire overflow;

StopwatchLogic SWLogic(
	CLK_100Hz,
	reset_n,
	start_stop,
	hold,
	stopwatch_unit_mins,
	stopwatch_unit_secs,
	stopwatch_unit_decs,
	overflow
);

assign overflow_flag = ~overflow;

SevenSegEncoder SevenSeg(
	stopwatch_unit_mins,
	stopwatch_unit_secs,
	stopwatch_unit_decs,
	ten_mins_seven_seg,
	one_min_seven_seg,
	ten_secs_seven_seg,
	one_sec_seven_seg,
	tenths_seven_seg,
	hundredths_seven_seg
);

endmodule

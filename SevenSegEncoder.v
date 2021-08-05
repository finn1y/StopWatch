module SevenSegEncoder(
	input [6:0] stopwatch_unit_mins,
	input [5:0] stopwatch_unit_secs,
	input [6:0] stopwatch_unit_decs,
	output [7:0] hex_10_mins,
	output [7:0] hex_1_min,
	output [7:0] hex_10_secs,
	output [7:0] hex_1_sec,
	output [7:0] hex_hundredths,
	output [7:0] hex_tenths
);

wire [35:0] BCD_out;

BCDEncoder BCD_mins(
	{1'd0, stopwatch_unit_mins},
	BCD_out[11:0]
);

BCDEncoder BCD_secs(
	{2'd0, stopwatch_unit_secs},
	BCD_out[23:12]
);


BCDEncoder BCD_decs(
	{1'd0, stopwatch_unit_decs},
	BCD_out[35:24]
);

BCDToSevenSeg SevenSeg_1_min(
	BCD_out[3:0],
	1'b0,	
	hex_1_min
);

BCDToSevenSeg SevenSeg_10_min(
	BCD_out[7:4],
	1'b1,	
	hex_10_mins
);

BCDToSevenSeg SevenSeg_1_sec(
	BCD_out[15:12],
	1'b0,	
	hex_1_sec
);

BCDToSevenSeg SevenSeg_10_sec(
	BCD_out[19:16],
	1'b1,	
	hex_10_secs
);

BCDToSevenSeg SevenSeg_tenths(
	BCD_out[27:24],
	1'b1,	
	hex_tenths
);

BCDToSevenSeg SevenSeg_hundredths(
	BCD_out[31:28],
	1'b1,	
	hex_hundredths
);

endmodule

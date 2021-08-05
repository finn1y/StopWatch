module BCDToSevenSeg(
	input [3:0] BCD_in,
	input dp,
	output [7:0] SevenSeg_out
);
assign SevenSeg_out[0] = ~(~BCD_in[3] & BCD_in[1] | ~BCD_in[3] & BCD_in[2] & BCD_in[0] | ~BCD_in[2] & ~BCD_in[1] & ~BCD_in[0] | BCD_in[3] & ~BCD_in[2] & ~BCD_in[1]);
assign SevenSeg_out[1] = ~(~BCD_in[3] & ~BCD_in[2] | ~BCD_in[3] & ~BCD_in[1] & ~BCD_in[0] | ~BCD_in[3] & BCD_in[1] & BCD_in[0] | BCD_in[3] & ~BCD_in[2] & ~BCD_in[1]);
assign SevenSeg_out[2] = ~(~BCD_in[3] & BCD_in[2] | ~BCD_in[3] & ~BCD_in[2] & BCD_in[0] | ~BCD_in[2] & ~BCD_in[1] & ~BCD_in[0] | BCD_in[3] & ~BCD_in[2] & ~BCD_in[1]);
assign SevenSeg_out[3] = ~(~BCD_in[3] & BCD_in[2] & ~BCD_in[1] & BCD_in[0] | BCD_in[3] & ~BCD_in[2] & ~BCD_in[1] | ~BCD_in[3] & BCD_in[1] & ~BCD_in[0] | ~BCD_in[3] & ~BCD_in[2] & ~BCD_in[0] | ~BCD_in[3] & ~BCD_in[2] & BCD_in[1]);
assign SevenSeg_out[4] = ~(~BCD_in[3] & BCD_in[1] & ~BCD_in[0] | ~BCD_in[2] & ~BCD_in[1] & ~BCD_in[0]);
assign SevenSeg_out[5] = ~(BCD_in[3] & ~BCD_in[2] & ~BCD_in[1] | ~BCD_in[3] & BCD_in[2] & ~BCD_in[0] | ~BCD_in[3] & BCD_in[2] & ~BCD_in[1] | ~BCD_in[3] & ~BCD_in[1] & ~BCD_in[0]);
assign SevenSeg_out[6] = ~(BCD_in[3] & ~BCD_in[2] & ~BCD_in[1] | ~BCD_in[3] & BCD_in[2] & ~BCD_in[1] | ~BCD_in[3] & ~BCD_in[2] & BCD_in[1] | ~BCD_in[3] & BCD_in[1] & ~BCD_in[0]);
assign SevenSeg_out[7] = dp;

endmodule 
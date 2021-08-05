`timescale 1 ps/ 100 fs

module Stopwatch_tb();

reg CLK_50;
reg reset_n;
reg start_stop;
reg hold;
wire [7:0] ten_mins_seven_seg;
wire [7:0] one_min_seven_seg;
wire [7:0] ten_secs_seven_seg;
wire [7:0] one_sec_seven_seg;
wire [7:0] tenths_seven_seg;
wire [7:0] hundredths_seven_seg;
wire overflow_flag;
	
always begin
	#10;
	CLK_50 <= ~CLK_50;
end 
	
initial begin
	CLK_50 <= 1'b0;
	reset_n <= 1'b0;
	start_stop <= 1'b1;
	hold <= 1'b1;
	#20;
	
	start_stop <= 1'b0;
	reset_n <= 1'b1;
	#10000000;
	
	start_stop <= 1'b1;
	hold <= 1'b0;
	#20;
	
	hold <= 1'b0;
	#100;
	
	start_stop <= 1'b0;
	#20;
	
	reset_n <= 1'b0;
	start_stop <= 1'b1;
	#20;
	
	start_stop <= 1'b1;
	#100;
	
	$stop;
end 
	
Stopwatch dut(
	CLK_50,
	reset_n,
	start_stop,
	hold,
	ten_mins_seven_seg,
	one_min_seven_seg,
	ten_secs_seven_seg,
	one_sec_seven_seg,
	tenths_seven_seg,
	hundredths_seven_seg,
	overflow_flag
);
	
endmodule 


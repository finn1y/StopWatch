`timescale 1 ms/ 100 us

module StopwatchLogic_tb();

reg CLK_100Hz;	
reg reset_n;
reg start_stop;
reg hold;
wire [6:0] stopwatch_unit_mins;
wire [5:0] stopwatch_unit_secs;
wire [6:0] stopwatch_unit_decs;
wire stopwatch_overflow;
	
always begin
	#5;
	CLK_100Hz <= ~CLK_100Hz;
end 
	
initial begin
	CLK_100Hz <= 1'b0;
	reset_n <= 1'b0;
	#10;
	
	reset_n <= 1'b1;
	hold <= 1'b1;
	start_stop <= 1'b0;
	#10;
	
	start_stop <= 1'b1;
	#10000000;
	
	start_stop <= 1'b0;
	#10;
	
	start_stop <= 1'b1;
	reset_n <= 1'b0;
	#10;
	
	start_stop <= 1'b0;
	reset_n <= 1'b1;
	#100;
	
	start_stop <= 1'b1;
	hold <= 1'b0;
	#10;
	
	hold <= 1'b1;
	#100;
	
	$stop;
end 
	
StopwatchLogic dut(
	CLK_100Hz,
	reset_n,
	start_stop,
	hold,
	stopwatch_unit_mins,
	stopwatch_unit_secs,
	stopwatch_unit_decs,
	stopwatch_overflow
);
	
endmodule 


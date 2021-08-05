`timescale 1 ns/ 100 ps

module ClockDivider50MHzTo100Hz_tb();

reg CLK_50_MHz;
reg reset_n;
wire CLK_100Hz;
	
always begin
	#10;
	CLK_50_MHz <= ~CLK_50_MHz;
end 
	
initial begin
	CLK_50_MHz <= 1'b0;
	reset_n <= 1'b0;
	#20;
	
	reset_n <= 1'b1;
	#11000000;
	
	reset_n <= 1'b0;
	#40;
	
	$stop;
end 
	
ClockDivider50MHzTo100Hz dut(
	CLK_50_MHz,
	reset_n,
	CLK_100Hz
);
	
endmodule 


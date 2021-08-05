`timescale 1 ns/ 100 ps

module JKFlipFlop_tb();

reg CLK;	
reg J;
reg K;
reg rst;
wire Q;
wire Q_n;
	
always begin
	#10
	CLK <= ~CLK;
end 
	
initial begin
	CLK <= 1'b0;
	rst<= 1'b1;
	#20;
	
	J <= 1'b1;
	K <= 1'b1;
	rst <= 1'b0;
	#60;
	
	J <= 1'b0;
	K <= 1'b0;
	#20;
	
	J <= 1'b0;
	K <= 1'b1;
	#20;
	
	J <= 1'b1;
	K <= 1'b0;
	#20;
		
	rst <= 1'b1;
	#20;
	
	J <= 1'b1;
	K <= 1'b1;
	rst <= 1'b0;
	#20;
	
	$stop;
end 
	
JKFlipFlop dut(
	CLK,
	J,
	K,
	rst,
	Q,
	Q_n
);
	
endmodule 


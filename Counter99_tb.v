`timescale 1 ms/ 100 us

module Counter99_tb();

reg CLK;	
reg rst_n;
wire [6:0] out;
	
always begin
	#5;
	CLK <= ~CLK;
end 
	
initial begin
	CLK <= 1'b0;
	rst_n <= 1'b0;
	#10;
	
	rst_n <= 1'b1;
	#1100;
	
	rst_n <= 1'b0;
	#20;
	
	$stop;
end 
	
Counter99 dut(
	CLK,
	rst_n,
	out
);
	
endmodule 


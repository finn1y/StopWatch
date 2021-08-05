`timescale 1 ms/ 100 us

module Counter59_tb();

reg CLK;	
reg rst_n;
wire [5:0] out;
	
always begin
	#5;
	CLK <= ~CLK;
end 
	
initial begin
	CLK <= 1'b0;
	rst_n <= 1'b0;
	#10;
	
	rst_n <= 1'b1;
	#500;
	
	rst_n <= 1'b0;
	#20;
	
	$stop;
end 
	
Counter59 dut(
	CLK,
	rst_n,
	out
);
	
endmodule 


`timescale 1 ns/ 100 ps

module Counter18Bit_tb();

reg CLK;	
reg rst_n;
wire [17:0] out;
wire overflow;
	
always begin
	#10;
	CLK <= ~CLK;
end 
	
initial begin
	CLK <= 1'b0;
	rst_n <= 1'b0;
	#20;
	
	rst_n <= 1'b1;
	#10000100;
	
	rst_n <= 1'b0;
	#40;
	
	$stop;
end 
	
Counter18Bit dut(
	CLK,
	rst_n,
	out,
	overflow
);
	
endmodule 


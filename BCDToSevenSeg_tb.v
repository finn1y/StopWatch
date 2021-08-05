`timescale 10 ns/ 100 ps

module BCDToSevenSeg_tb();

reg [3:0] in;
reg dp;
wire [7:0] out;

BCDToSevenSeg dut(
	in,
	dp,
	out
);
	
integer i;
integer expected_output;
integer actual_output;
	
initial begin
	dp = 1'b1;

	for (i = 0; i < 10; i = i + 1) begin
		
		in = i;
		
		#10;
		
		actual_output = out;
			
		case (i)										//non inverted result
			0:	expected_output = 8'b11000000; //8'b00111111
			1: expected_output = 8'b11111001; //8'b00000110
			2: expected_output = 8'b10100100; //8'b01011011
			3:	expected_output = 8'b10110000; //8'b01001111
			4:	expected_output = 8'b10011001; //8'b01100110
			5:	expected_output = 8'b10010010; //8'b01101101
			6:	expected_output = 8'b10000010; //8'b01111101
			7:	expected_output = 8'b11111000; //8'b00000111
			8:	expected_output = 8'b10000000; //8'b01111111
			9:	expected_output = 8'b10010000; //8'b01101111
		endcase 

		if (expected_output != actual_output) begin
			$display("Incorrect result at %d%d%d%d", in[3], in[2], in[1], in[0]);
		end
	end
	
	$stop;
end

endmodule 
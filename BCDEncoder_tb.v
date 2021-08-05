`timescale 10 ns/ 100 ps

module BCDEncoder_tb();

reg [7:0] in;
wire [11:0] out;

BCDEncoder dut(
	in,
	out
);
	
integer i;
integer expected_output;
integer actual_output;
	
initial begin
	for (i = 0; i < 256; i = i + 1) begin
		
		in = i;
		
		#10;
		
		actual_output = out;
			

		if (expected_output != actual_output) begin
			$display("Incorrect result at %b", in);
		end
	end
	
	$stop;
end

endmodule 
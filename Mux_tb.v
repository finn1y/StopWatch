`timescale 1 ns/ 100 ps

module Mux_tb();

reg [1:0] in;
reg sel;
wire out;

Mux dut(
	in,
	sel,
	out
);

integer i;
integer actual_output;
integer expected_output;

initial begin
	$display("sel = 0");
	sel = 1'b0;

	for (i = 0; i < 4; i = i + 1) begin
		in = i;
		
		#10
		
		actual_output = out;
		
		case (i)
			0: expected_output = 1'b0;
			1: expected_output = 1'b1;
			2: expected_output = 1'b0;
			3: expected_output = 1'b1;
		endcase
		
		if (actual_output != expected_output) begin
			$display("Incorrect result at in = %b", in);
		end
	end
	
	$display("sel = 1");
	sel = 1'b1;

	for (i = 0; i < 4; i = i + 1) begin
		in = i;
		
		#10
		
		actual_output = out;
		
		case (i)
			0: expected_output = 1'b0;
			1: expected_output = 1'b0;
			2: expected_output = 1'b1;
			3: expected_output = 1'b1;
		endcase
		
		if (actual_output != expected_output) begin
			$display("Incorrect result at in = %b", in);
		end
	end
	$stop;
end

endmodule 
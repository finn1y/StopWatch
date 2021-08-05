module Mux(
	input [1:0] in,
	input sel,
	output out
);

assign out = in[sel];

endmodule 
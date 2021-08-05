module Counter59(
	input CLK,
	input rst_n,
	output [5:0] out
);

wire [5:0] ff_out;
wire [5:0] ff_out_n;

JKFlipFlop ff0(
	CLK,
	1'b1,
	1'b1,
	~rst_n,
	ff_out[0],
	ff_out_n[0]
);

JKFlipFlop ff1(
	ff_out_n[0],
	1'b1,
	1'b1,
	~rst_n,
	ff_out[1],
	ff_out_n[1]
);

JKFlipFlop ff2(
	ff_out_n[1],
	1'b1,
	1'b1,
	~rst_n,
	ff_out[2],
	ff_out_n[2]
);

JKFlipFlop ff3(
	ff_out_n[2],
	1'b1,
	1'b1,
	~rst_n,
	ff_out[3],
	ff_out_n[3]
);

JKFlipFlop ff4(
	ff_out_n[3],
	1'b1,
	1'b1,	
	~rst_n,
	ff_out[4],
	ff_out_n[4]
);

JKFlipFlop ff5(
	ff_out_n[4],
	1'b1,
	1'b1,
	~rst_n,
	ff_out[5],
	ff_out_n[5]
);

assign out = {ff_out[5], ff_out[4], ff_out[3], ff_out[2], ff_out[1], ff_out[0]};

endmodule 
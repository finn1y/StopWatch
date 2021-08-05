module Counter18Bit(
	input CLK,
	input rst_n,
	output [17:0] out
);

wire [17:0] ff_out;
wire [15:0] ff_in;

wire rst;

JKFlipFlop ff0(
	CLK,
	1'b1,
	1'b1,
	rst,
	ff_out[0]
);

JKFlipFlop ff1(
	CLK,
	ff_out[0],
	ff_out[0],
	rst,
	ff_out[1]
);

assign ff_in[0] = ff_out[1] & ff_out[0];

JKFlipFlop ff2(
	CLK,
	ff_in[0],
	ff_in[0],
	rst,
	ff_out[2]
);

assign ff_in[1] = ff_in[0] & ff_out[2];

JKFlipFlop ff3(
	CLK,
	ff_in[1],
	ff_in[1],
	rst,
	ff_out[3]
);

assign ff_in[2] = ff_in[1] & ff_out[3];

JKFlipFlop ff4(
	CLK,
	ff_in[2],
	ff_in[2],
	rst,
	ff_out[4]
);

assign ff_in[3] = ff_in[2] & ff_out[4];

JKFlipFlop ff5(
	CLK,
	ff_in[3],
	ff_in[3],
	rst,
	ff_out[5]
);

assign ff_in[4] = ff_in[3] & ff_out[5];

JKFlipFlop ff6(
	CLK,
	ff_in[4],
	ff_in[4],
	rst,
	ff_out[6]
);

assign ff_in[5] = ff_in[4] & ff_out[6];

JKFlipFlop ff7(
	CLK,
	ff_in[5],
	ff_in[5],
	rst,
	ff_out[7]
);

assign ff_in[6] = ff_in[5] & ff_out[7];

JKFlipFlop ff8(
	CLK,
	ff_in[6],
	ff_in[6],
	rst,
	ff_out[8]
);

assign ff_in[7] = ff_in[6] & ff_out[8];

JKFlipFlop ff9(
	CLK,
	ff_in[7],
	ff_in[7],
	rst,
	ff_out[9]
);

assign ff_in[8] = ff_in[7] & ff_out[9];

JKFlipFlop ff10(
	CLK,
	ff_in[8],
	ff_in[8],
	rst,
	ff_out[10]
);

assign ff_in[9] = ff_in[8] & ff_out[10];

JKFlipFlop ff11(
	CLK,
	ff_in[9],
	ff_in[9],
	rst,
	ff_out[11]
);

assign ff_in[10] = ff_in[9] & ff_out[11];

JKFlipFlop ff12(
	CLK,
	ff_in[10],
	ff_in[10],
	rst,
	ff_out[12]
);

assign ff_in[11] = ff_in[10] & ff_out[12];

JKFlipFlop ff13(
	CLK,
	ff_in[11],
	ff_in[11],
	rst,
	ff_out[13]
);

assign ff_in[12] = ff_in[11] & ff_out[13];

JKFlipFlop ff14(
	CLK,
	ff_in[12],
	ff_in[12],
	rst,
	ff_out[14]
);

assign ff_in[13] = ff_in[12] & ff_out[14];

JKFlipFlop ff15(
	CLK,
	ff_in[13],
	ff_in[13],
	rst,
	ff_out[15]
);

assign ff_in[14] = ff_in[13] & ff_out[15];

JKFlipFlop ff16(
	CLK,
	ff_in[14],
	ff_in[14],
	rst,
	ff_out[16]
);

assign ff_in[15] = ff_in[14] & ff_out[16];

JKFlipFlop ff17(
	CLK,
	ff_in[15],
	ff_in[15],
	rst,
	ff_out[17]
);

assign out = {ff_out[17], ff_out[16], ff_out[15], ff_out[14], ff_out[13], ff_out[12], ff_out[11], ff_out[10],
				ff_out[9], ff_out[8], ff_out[7], ff_out[6], ff_out[5], ff_out[4], ff_out[3], ff_out[2], ff_out[1], ff_out[0]};

wire max_val = ff_out[17] & ff_out[16] & ff_out[15] & ff_out[14] & ff_out[12] & ff_out[7] & ff_out[4];

Mux rst_mux(
	{max_val, 1'b1},
	rst_n,
	rst
);

endmodule 
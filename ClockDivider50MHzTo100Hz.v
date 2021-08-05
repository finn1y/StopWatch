module ClockDivider50MHzTo100Hz (
	input CLK_50_MHz,
	input reset_n,
	output reg CLK_100Hz
);

wire [17:0] counter_out;
wire ff_out;

Counter18Bit counter(
	CLK_50_MHz,
	reset_n,
	counter_out
);

wire [17:0] comparator_bus = counter_out ~^ 18'd249999;
wire comparator = comparator_bus[0] & comparator_bus[1] & comparator_bus[2] & comparator_bus[3] &
						comparator_bus[4] & comparator_bus[5] & comparator_bus[6] & comparator_bus[7] &
						comparator_bus[8] & comparator_bus[9] & comparator_bus[10] & comparator_bus[11] &
						comparator_bus[12] & comparator_bus[13] & comparator_bus[14] & comparator_bus[15] &
						comparator_bus[16] & comparator_bus[17];

JKFlipFlop ff(
	CLK_50_MHz,
	comparator,
	comparator,
	~reset_n,
	ff_out
);

wire CLK_out;

Mux rst_mux(
	{ff_out, 1'b0},
	reset_n,
	CLK_out
);

always @(posedge CLK_50_MHz) begin
	CLK_100Hz <= CLK_out;
end

endmodule

module JKFlipFlop(
	input CLK,
	input J,
	input K,
	input rst,
	output reg Q,
	output reg Q_n
);

always @(posedge CLK or posedge rst) begin
	if (rst) begin
		Q <= 1'b0;		
		Q_n <= 1'b1;
	end
	else begin
		if (!J && K) begin
			Q <= 1'b0;
			Q_n <= 1'b1;
		end
		else if (J && !K) begin
			Q <= 1'b1;
			Q_n <= 1'b0;
		end
		else if (J && K) begin
			Q <= ~Q;	
			Q_n <= ~Q_n;
		end
	end
end

endmodule 
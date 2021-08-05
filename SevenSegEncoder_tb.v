`timescale 10 ns/ 100 ps

module SevenSegEncoder_tb();

reg [6:0] mins_in;
reg [5:0] secs_in;
reg [6:0] decs_in;

wire [7:0] mins_10;
wire [7:0] min_1;
wire [7:0] secs_10;
wire [7:0] sec_1;
wire [7:0] tenths;
wire [7:0] hundredths;


SevenSegEncoder dut(
	mins_in,
	secs_in,
	decs_in,
	mins_10,
	min_1,
	secs_10,
	sec_1,
	tenths,
	hundredths
);

integer i;
integer actual_output;
integer expected_output;

initial begin
	for (i = 0; i < 100; i = i + 1) begin
		mins_in = i;
		secs_in = i % 59;
		decs_in = i;
		
		#10;
		
		actual_output = {mins_10,min_1,secs_10,sec_1,tenths,hundredths};
					
		case (mins_in / 10)
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
		
		case (mins_in % 10)
			0:	expected_output = {expected_output, 8'b01000000};
			1: expected_output = {expected_output, 8'b01111001};
			2: expected_output = {expected_output, 8'b00100100};
			3:	expected_output = {expected_output, 8'b00110000};
			4:	expected_output = {expected_output, 8'b00011001};
			5:	expected_output = {expected_output, 8'b00010010};
			6:	expected_output = {expected_output, 8'b00000010};
			7:	expected_output = {expected_output, 8'b01111000};
			8:	expected_output = {expected_output, 8'b00000000};
			9:	expected_output = {expected_output, 8'b00010000};
		endcase 
		
		case (secs_in / 10)
			0:	expected_output = {expected_output, 8'b11000000};
			1: expected_output = {expected_output, 8'b11111001};
			2: expected_output = {expected_output, 8'b10100100};
			3:	expected_output = {expected_output, 8'b10110000};
			4:	expected_output = {expected_output, 8'b10011001};
			5:	expected_output = {expected_output, 8'b10010010};
			6:	expected_output = {expected_output, 8'b10000010};
			7:	expected_output = {expected_output, 8'b11111000};
			8:	expected_output = {expected_output, 8'b10000000};
			9:	expected_output = {expected_output, 8'b10010000};
		endcase 
		
		case (secs_in % 10)
			0:	expected_output = {expected_output, 8'b01000000};
			1: expected_output = {expected_output, 8'b01111001};
			2: expected_output = {expected_output, 8'b00100100};
			3:	expected_output = {expected_output, 8'b00110000};
			4:	expected_output = {expected_output, 8'b00011001};
			5:	expected_output = {expected_output, 8'b00010010};
			6:	expected_output = {expected_output, 8'b00000010};
			7:	expected_output = {expected_output, 8'b01111000};
			8:	expected_output = {expected_output, 8'b00000000};
			9:	expected_output = {expected_output, 8'b00010000};
		endcase

		case (decs_in / 10)
			0:	expected_output = {expected_output, 8'b11000000};
			1: expected_output = {expected_output, 8'b11111001};
			2: expected_output = {expected_output, 8'b10100100};
			3:	expected_output = {expected_output, 8'b10110000};
			4:	expected_output = {expected_output, 8'b10011001};
			5:	expected_output = {expected_output, 8'b10010010};
			6:	expected_output = {expected_output, 8'b10000010}; 
			7:	expected_output = {expected_output, 8'b11111000};
			8:	expected_output = {expected_output, 8'b10000000};
			9:	expected_output = {expected_output, 8'b10010000};
		endcase 
		
		case (decs_in % 10)
			0:	expected_output = {expected_output, 8'b11000000};
			1: expected_output = {expected_output, 8'b11111001};
			2: expected_output = {expected_output, 8'b10100100};
			3:	expected_output = {expected_output, 8'b10110000};
			4:	expected_output = {expected_output, 8'b10011001};
			5:	expected_output = {expected_output, 8'b10010010};
			6:	expected_output = {expected_output, 8'b10000010}; 
			7:	expected_output = {expected_output, 8'b11111000};
			8:	expected_output = {expected_output, 8'b10000000};
			9:	expected_output = {expected_output, 8'b10010000};
		endcase 	 		
	
		if(actual_output != expected_output) begin		
			$display("Incorrect result at %d.%d.%d", mins_in, secs_in, decs_in);
		end 	
	end
	
	$stop;
end

endmodule 
module top_module(
	input [1:0]SW,
	input CLOCK_50,
	output [1:1]LEDR,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3
);	
	wire [12:0]channel0, channel1;
	
	ADC adc(.CLOCK(CLOCK_50), .CH0(channel0), .CH1(channel1), .RESET(SW[0]));

	reg [16:0]display;
	four_digit_bcd bcds(.din(display), .hex0(HEX0), .hex1(HEX1), .hex2(HEX2), .hex3(HEX3));
	
	assign LEDR[1] = SW[1];
	always @(*)begin
		if (SW[1]) begin
			display = channel1;
		end
		else begin
			display = channel0;
		end
	end

endmodule 
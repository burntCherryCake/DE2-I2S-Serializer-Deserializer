module processing (
	input LRCK,
	input [15:0] AUD_IN,
	output reg [15:0] AUD_OUT,
	output reg LED_OUT
);

reg [15:0] hold[0:10];

always @(posedge LRCK) begin
	AUD_OUT = hold[10];
	hold[10] = hold[10] + hold [9] + hold[8] + hold[7] + hold[6] + hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[9] = hold [9] + hold[8] + hold[7] + hold[6] + hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[8] = hold[8] + hold[7] + hold[6] + hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[7] = hold[7] + hold[6] + hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[6] = hold[6] + hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[5] = hold[5] + hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[4] = hold[4] + hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[3] = hold[3] + hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[2] = hold[2] + hold[1] + hold[0] + AUD_IN;
	hold[1] = hold[1] + hold[0] + AUD_IN;
	hold[0] = hold[0] + AUD_IN;
end
endmodule

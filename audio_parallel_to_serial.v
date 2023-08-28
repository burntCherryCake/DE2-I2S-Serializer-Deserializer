module audio_parallel_to_serial (
	// Audio side
	input AUD_BCK,    // Audio bit clock
	input AUD_LRCK,   // left-right clock
	output reg AUD_DATA = 0,
	// Controller side
	input [15:0] AUD_inL,
	input [15:0] AUD_inR,
	output reg [3:0] counter,
	output reg test
);


//	16 Bits - MSB First
// Clocks in the ADC input
// and sets up the output bit selector
reg [3:0] count=4'hF;
reg LRprev = 1'b0;
reg counterMaxed=1'b0;
reg go = 1'b0;
reg LorR = 1'b0;
always@(negedge AUD_BCK) //clock out data on negedge before the DAC samples it on the posedge.
begin
		//testbench shows bit is 1 early, but logic analyzer meas shows the correct placement. Probably need a delayed version of LRCLK stored on the rising edge.
		if(go == 1'b1) begin
			//start data tx by resetting counter to the 16th bit
			counter = 4'hF;
			LorR = AUD_LRCK; //save the LR clock so we can still transmit the LSB after LRclk switches
		end
		
		//transmit data before decrementing counter
		AUD_DATA = LorR?(AUD_inR[counter]):(AUD_inL[counter]);
		
		//decrement counter
		if(counter != 4'b0) begin
			counter = counter - 1;
		end
		test = LorR;
end

always @(posedge AUD_BCK) begin
	if(LRprev != AUD_LRCK) begin
			//LRclk got toggled
			go = 1'b1; //on the next bitclock negedge, start data tx
			
		end else begin
			//LRclk did not get toggled
			go = 1'b0;
	end
	LRprev = AUD_LRCK;
end
endmodule
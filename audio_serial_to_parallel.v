module audio_serial_to_parallel (
	// Audio side
	input AUD_BCK,    // Audio bit clock
	input AUD_LRCK,   // left-right clock
	input AUD_ADCDAT,
	// Controller side
	output reg [15:0] AUD_outL = 16'b0,
	output reg [15:0] AUD_outR = 16'b0
	//output reg [15:0] test,
	//output reg [3:0] test2
);


//	16 Bits - MSB First
// Clocks in the ADC input
// and sets up the output bit selector
reg [3:0] counter = 16'b1111;
reg LRprev = 1'b0;
reg LRnow = 1'b0;
reg counterMaxed=1'b1;
reg [15:0] audL_temp = 16'b0;
reg [15:0] audR_temp = 16'b0;
reg newR = 0;
reg newL = 0;
reg outDone = 1'b1; //first LRCLK edge sets this to 0.
always@(posedge AUD_BCK) //see WM8731 datasheet figure 27. data cloks in on POSEDGE of bit clock.
begin	

	//check for LR clock toggles and update state
	newL = LRprev && ~AUD_LRCK;
	newR = ~LRprev && AUD_LRCK;
	LRprev = AUD_LRCK;
	//=============================================

	if(~outDone) begin //if in the middle of count, keep clocking out data.
		if(AUD_LRCK) begin
			//AUD_LRCK == 1 means R channel
			audR_temp[counter] = AUD_ADCDAT;
		end else begin
			//AUD_LRCK == 0 means L channel
			audL_temp[counter] = AUD_ADCDAT;
		end
	end
	
	
	if(counter > 16'b0) begin
		counter = counter - 16'b1;
	end else begin
		outDone = 1'b1;
	end
	
	//if LRCLK just toggled, the bit sent above was the last bit of the last frame. Start new frame on next LRCLK edge and release current data to output.
	if(newR || newL) begin
		counter = 16'b1111;
		outDone = 1'b0;
		if(newR) begin
			AUD_outL= audL_temp;
		end else if (newL) begin
			AUD_outR = audR_temp;
		end
	end
end


endmodule
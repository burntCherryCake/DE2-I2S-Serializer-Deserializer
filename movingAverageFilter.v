module movingAverageFilter(
	output reg [17:0] addr_out = 18'b0,
	output reg signed [15:0] data_out,
	output reg rwb = 1'b0,
	input wire BCK,
	input wire LRCK,
	input wire signed [15:0] inL,
	input wire signed [15:0] inR,
	input wire signed [15:0] memoryRead,
	output reg signed [15:0] outL,
	output reg signed [15:0] outR,
	output reg [15:0] testOut,
	output reg [15:0] testOut2,
	output reg testOutt3,
	output reg [15:0] addrTest
);
	reg LRCK_prev;
	initial LRCK_prev = LRCK;
	reg signed [15:0] avgLength = 80; //static value
	integer accumulatorL = 0;
	integer accumulatorR = 0;
	reg [7:0] BCKCounter = 0; //counter length greater than number of BCK cycles per LRCK toggle
	integer gain = 2;
	
	
always @(posedge BCK) begin
	BCKCounter = (LRCK != LRCK_prev)?8'b1:BCKCounter + 1; //update state counter, reset to 1 if LRCK toggled.
	
	case (BCKCounter)
		8'd2:	rwb = 1;
		8'd3: begin
			testOut = memoryRead;
			//read old memory and calculate current output
			accumulatorL = LRCK ? (accumulatorL+inL-memoryRead) : accumulatorL;
			accumulatorR = LRCK ? accumulatorR : (accumulatorR+inR-memoryRead);
			outL = LRCK?(accumulatorL/avgLength*gain):outL ; //update L channel if LRCK is high (R channel is transmitting)
			outR = LRCK? outR:(accumulatorR/avgLength*gain);
			
			data_out = LRCK?inL:inR;
			testOut2 = data_out;
			rwb = 0; //write new input to same memory addr we read from.
		end
		8'd4: rwb = 1;
		8'd5: addr_out = (addr_out == (avgLength-1))? 18'b0:(addr_out + 1); //update address to get ready for next LRCK cycle
	endcase
	addrTest = addr_out[15:0];
	LRCK_prev = LRCK;
end
endmodule
//default code. Loads reg map i2c settings to WM8731.
`define rom_size 6'd11

module CLOCK_500 (
	CLOCK,
	CLOCK_500,
	DATA,
	END,
	RESET,
	GO,
	CLOCK_2
);
	input  CLOCK;
	input  END;
	input  RESET;
	output CLOCK_500;
	output [23:0]DATA;
	output GO;
	output CLOCK_2;


reg  [10:0]COUNTER_500;

wire  CLOCK_500=COUNTER_500[9];
wire  CLOCK_2=COUNTER_500[1];

reg  [15:0]ROM[`rom_size:0];
reg  [15:0]DATA_A;
reg  [5:0]address=0;
wire [23:0]DATA={8'h34,DATA_A};
	
wire  GO =((address <= `rom_size) && (END==1))? COUNTER_500[10]:1;
always @(negedge RESET or posedge END) begin
	if (!RESET) address=0;
	else 
	if (address < `rom_size) address=address+1;
end

reg [7:0]vol;

always @(posedge RESET) begin
	vol=vol-1;end


always @(posedge END) begin
	//ROM[x]: first 7 bits is address, last 9 bits is data. See table 29 in DS.
	ROM[0]= 	16'b0001111000000000;		//reset 
	ROM[1]= 	16'b0001001000000000;		//set active = false
	ROM[6]= 	16'b0000000000010111;		//left line in settings: 0db no mute
	ROM[3]= 	16'b0000001000010111;		//right line in settings 0db no mute
//	ROM[3]= 	16'b0100000111000;	     	//Analog audio path ctrl: no boost, no mute, line in -> ADC, select DAC, sidetone -6dB attn
//	ROM[3]= 	16'b0100011101001;			//disable line_in -> audio output path, enable mic boost
	ROM[4]= 	16'b0000100000010010; 		//DAC only no sidetone no linein-bypass
	ROM[5]= 	16'b0000101000000000; 		//disable DAC mute
	ROM[2]= 	16'b0000110000000000;	   //un-power down, enable all blocks
	ROM[7]= 	16'b0000111001000010;	   //16-bit I2S format, master mode with BCLK invert
	ROM[8]= 	16'b0001000000011100;		//Sampling Control: core clock is not div2. mclk DAC and ADC both 96kHz
	ROM[9]= 	{8'h04,1'b0,vol[6:0]};		//sound vol
	ROM[10]= {8'h06,1'b0,vol[6:0]};	   //sound vol
	ROM[11]= 16'b0001001000000001;		//set active bit = true. Activate digital audio interface after sampling rate and stuff set.
	DATA_A=ROM[address];
end

always @(posedge CLOCK ) begin
	COUNTER_500=COUNTER_500+1;
end

endmodule

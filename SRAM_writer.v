module memWriter(
	output reg [17:0] addr_out,
	output reg [15:0] data_out,
	output reg writePulse,
	output reg readPulse,
	input wire SRAM_CLK
);

	reg [15:0] data = 16'hAAAA;
	reg [17:0] addr = 18'b101;
	reg [5:0] counter = 6'b0;
	integer i;
	
always @(posedge SRAM_CLK) begin
		if(counter == 6'b0)begin //when to start the write pulse (counter = 0) and end the read pulse
			readPulse <= 0;
			addr_out = addr;
			data_out = data;
			writePulse <= 1;
		end else if(counter == 6'b000100) begin //when to stop the write pulse (counter = 4)
			writePulse <= 0;
		end else if(counter == 6'b000110) begin //when to start the read pulse (counter = 16)
			addr_out = addr;
			readPulse <= 1;
		end
		counter = counter + 1;
end
endmodule
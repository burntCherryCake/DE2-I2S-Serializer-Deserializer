module memReader(
	
	input wire SRAM_CLK,
	output reg [17:0] addrToReadFrom,
	output reg readPulse
);

reg [17:0] addr = 18'b101;
integer i;
always @(posedge SRAM_CLK) begin
		addrToReadFrom = addr;
		readPulse = 1;
		for(i = 0; i<10000; i = i+1) begin
			//wait
		end
		readPulse = 0;
end
endmodule
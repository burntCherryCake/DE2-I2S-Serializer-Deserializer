module div2_20(
	input wire MHz50_in,
	output wire Hz1047576_out
);

reg [14:0] counter = 0;

always @(posedge MHz50_in)begin
	counter = counter + 1;
end

assign Hz1047576_out = counter[14];

endmodule
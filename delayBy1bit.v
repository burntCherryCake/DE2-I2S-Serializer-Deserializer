module delayBy1bit(
	input wire bck,
	input wire lrck,
	input wire aud,
	output reg out
);

reg bithold = 1'b0;

always @(negedge bck) begin
	out = bithold;
	bithold = aud;
end
endmodule
module LED_STATUS(
	input btn,
	input [15:0] din,
	output reg led0,
	output reg led1,
	output reg led2,
	output reg led3,
	output reg led4,
	output reg led5,
	output reg led6,
	output reg led7,
	output reg led8,
	output reg led9,
	output reg led10,
	output reg led11,
	output reg led12,
	output reg led13,
	output reg led14,
	output reg led15
);
always @(posedge btn) begin
	led0 = din[0];
	led1 = din[1];
	led2 = din[2];
	led3 = din[3];
	led4 = din[4];
	led5 = din[5];
	led6 = din[6];
	led7 = din[7];
	led8 = din[8];
	led9 = din[9];
	led10 = din[10];
	led11 = din[11];
	led12 = din[12];
	led13 = din[13];
	led14 = din[14];
	led15 = din[15];
end

endmodule
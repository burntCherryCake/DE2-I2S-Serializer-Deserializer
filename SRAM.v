module SRAM(
	input wire [17:0] Raddr_in,
	output reg [15:0] Rdata_out,
	input wire doRead,
	inout reg [15:0] data_inout,
	input wire [17:0] Waddr_in,
	input wire [15:0] Wdata_in,
	
	output wire [17:0] addr_out,
	input wire doWrite,
	
	output wire write_enable,
	output wire output_enable,
	output wire high_mask,
	output wire low_mask,
	output wire chip_enable
);
reg rwnowR = 0;
reg rwnowW = 0;
reg wenowR = 0;
reg wenowW = 0;
reg [17:0] addr_outW;
reg [17:0] addr_outR;

//Configuration
assign chip_enable = 1'b0; //always enable (all negative logic)
assign output_enable = 1'b0; //always enable
assign low_mask = 1'b0; //always low for both bytes at the same time
assign high_mask = 1'b0;//always low for both bytes at the same time

always @(posedge doRead) begin
	addr_outR = Raddr_in;
	wenowR = 1'b1; //read mode
	rwnowR = 0;
	//wait 15ns?
	Rdata_out = data_inout;
end

always @(posedge doWrite) begin
	addr_outW = Waddr_in;
	data_inout = Wdata_in;
	wenowW = 0;
	data_inout = 16'bz;
	rwnowW = 1;
	wenowW = 1;
end

assign addr_out = (rwnowW || rwnowR)?addr_outW:addr_outR;
assign write_enable = (wenowW || wenowR)?0:1;

endmodule
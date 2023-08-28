/*****************************************************************************
 *                                                                           *
 * Module:       SRAM_Controller                                             *
 * Description:                                                              *
 *      This module is used for the sram controller for 3TB4 lab 4           *
 *                                                                           *
 *****************************************************************************/

module SRAM_Controller (
input clk,       //done
input	[17:0]	address, //done
input	rwb,
input	[15:0]	write_data,

// Bidirectionals
inout wire [15:0] SRAM_DQ,   //used for both reading and writing

// Outputs
output wire [15:0]	read_data,

output [17:0]	SRAM_ADDR,
output SRAM_CE_N,
output SRAM_WE_N,
output SRAM_OE_N,
output SRAM_UB_N,
output SRAM_LB_N
);

assign SRAM_ADDR = address; //Telling the SRAM that this is the address that we are interested in. //d
assign SRAM_CE_N = 1'b0;
assign SRAM_WE_N = rwb;
assign SRAM_OE_N = 1'b0;
assign SRAM_UB_N = 1'b0;
assign SRAM_LB_N = 1'b0;

assign read_data = (rwb)?SRAM_DQ:16'bz;
assign SRAM_DQ = (!rwb)?write_data:16'bz;
// write
endmodule

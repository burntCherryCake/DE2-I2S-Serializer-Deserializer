module MUX_1bit (
	EN,
	IN0,
	IN1,
	OUT
);
	input wire EN;
	input wire IN0;
	input wire IN1;
 	output wire OUT;
	
	assign OUT=EN?IN0:IN1;
endmodule

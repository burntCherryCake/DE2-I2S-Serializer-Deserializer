module FIR_Filter (
    input wire [15:0] AUD_IN,
    output reg [15:0] AUD_OUT
);
    // Filter coefficients (adjust according to desired filter characteristics)
	 reg [15:0] COEFFS0 = 16'h0ABC;
	 reg [15:0] COEFFS1 = 16'h1234;
	 reg [15:0]COEFFS2 = 16'h5678;

    // Internal signals
    reg [15:0] delay_line [0:2];

    always @(AUD_IN) begin
        // Shift values in delay line
        delay_line[2] <= delay_line[1];
        delay_line[1] <= delay_line[0];
        delay_line[0] <= AUD_IN;

        // Filter output computation
        AUD_OUT <= (COEFFS2 * delay_line[2]) + (COEFFS1 * delay_line[1]) + (COEFFS0 * delay_line[0]);
    end
endmodule
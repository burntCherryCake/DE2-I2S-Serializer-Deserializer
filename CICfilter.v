/*
chatgpt says
    1. Normalized digital frequency: f_cutoff = 1kHz / 48kHz = 0.02083.
    2. Choosing a power of 2 for R, let's start with R = 2^3 = 8.
    3. Calculate M using the formula: M = floor((1 - 1/8) / (2 * 0.02083)) ≈ 5.
*/

module CIC_Filter (
    input wire LRCK,
    input [15:0] AUD_IN,
    output reg [15:0] AUD_OUT
);
    // Define the parameters for the filter
    parameter R = 8;  // Decimation factor
    parameter M = 5;  // Differential delay

    // Internal signals
    reg [15:0] integrator = 16'h0000;
    reg [15:0] comb1 = 16'h0000;
    reg [15:0] comb2 = 16'h0000;
    reg [15:0] comb3 = 16'h0000;

    always @(posedge LRCK) begin
        // Comb Stage 1
        comb1 <= comb2;
        comb2 <= comb3;
        comb3 <= AUD_IN - comb1;

        // Integrator Stage
        if (M == 1) begin
            integrator <= integrator + comb3;
        end else begin
            integrator <= integrator >> M + comb3;
        end

        // Output Stage
        if (R == 1) begin
            AUD_OUT <= integrator;
        end else begin
            AUD_OUT <= integrator >> (R-1);
        end
    end
endmodule
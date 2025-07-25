module mux_n_to_1 #(parameter N = 8) (   // N inputs
    input  [N-1:0] in,                   // Input vector
    input  [$clog2(N)-1:0] sel,         // Select line (log2(N) bits)
    output reg out                      // Output
);
    always @(*) begin
        out = in[sel];                  // Core MUX logic
    end
endmodule

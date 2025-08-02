module siso (
    input clk,
    input d,
    output out
);
    wire q1, q2, q3; // internal flip-flop outputs

    // Chain of 4 D flip-flops
    d_ff ff1(.clk(clk), .d(d),  .q(q1));
    d_ff ff2(.clk(clk), .d(q1), .q(q2));
    d_ff ff3(.clk(clk), .d(q2), .q(q3));
    d_ff ff4(.clk(clk), .d(q3), .q(out));
endmodule

// Single positive-edge D flip-flop
module d_ff (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk)
        q <= d;
endmodule

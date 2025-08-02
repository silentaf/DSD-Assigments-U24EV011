module siso (
    input clk,
    input reset,       
    input d,
    output out1, output out2, output out3, output out4);

  d_ff ff1(clk, reset, d, out1);
  d_ff ff2(clk, reset, out1, out2);
  d_ff ff3(clk, reset, out2, out3);
  d_ff ff4(clk, reset, out3, out4);

endmodule

module d_ff (
    input clk,
    input reset,        
    input d,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;   
        else
            q <= d;
    end
endmodule

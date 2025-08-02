module pipo(
    input clk,
    input reset,       
    input d1, input d2, input d3,input d4, 
    output out1, output out2, output out3, output out4);

  d_ff ff1(clk, reset, d1, out1);
  d_ff ff2(clk, reset, d2, out2);
  d_ff ff3(clk, reset, d2, out3);
  d_ff ff4(clk, reset, d4, out4);

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

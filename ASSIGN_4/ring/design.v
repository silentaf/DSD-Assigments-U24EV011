//ring
module ring(input reset,input clk, output reg[3:0] out);
  
  always @(posedge clk )
    begin
      if(reset)
        out=4'b0001;
      else
        out={out[2:0], out[3]};
    end
endmodule

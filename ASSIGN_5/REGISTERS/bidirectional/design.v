module universal( input clk, input reset,input sel, input[3:0] in_load,input in, output reg[3:0] out);
  always @(posedge clk)
    begin
      if(reset)
        out<=4'b0000;
      else
        case (sel)
          1'b0 : out<={out[2:0], in};
          1'b1: out<={in, out[3:1]};
          default: out<=out;
          
        endcase
    end

endmodule

module universal( input clk, input reset,input[1:0] sel, input[3:0] in_load,input in, output reg[3:0] out);
  always @(posedge clk)
    begin
      if(reset)
        out<=4'b0000;
      else
        case (sel)
          2'b00 : out<= out;
          2'b01: out<={in, out[3:1]};
          2'b10: out<= { out[2:0], in};
          2'b11: out<= in_load;
          default: out<=out;
          
        endcase
    end

endmodule

//1*2
module demux(input in, input sel, output reg[1:0] out);
  always @(*)
    begin
      out = 2'b00;
      case( sel)
        1'b0: out[0]=in;
        1'b1: out[1]=in;
      endcase
    end
endmodule

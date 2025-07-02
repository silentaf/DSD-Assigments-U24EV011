module encoder_4x2(input [3:0] in, output [1:0] out);
  assign out = (in[3]) ? 2'b11 :
               (in[2]) ? 2'b10 :
               (in[1]) ? 2'b01 : 2'b00;
endmodule

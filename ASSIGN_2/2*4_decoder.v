module decoder_2x4(input [1:0] in, input en, output [3:0] out);
  assign out = en ? (1 << in) : 4'b0000;
endmodule

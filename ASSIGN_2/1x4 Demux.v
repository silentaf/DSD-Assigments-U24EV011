module demux_1x4(input in, input [1:0] sel, output [3:0] out);
  assign out = (1 << sel) & {4{in}};
endmodule

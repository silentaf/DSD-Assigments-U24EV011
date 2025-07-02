module mux_Nx1 #(parameter N = 8)(
  input [N-1:0] in,
  input [$clog2(N)-1:0] sel,
  output y
);
  assign y = in[sel];
endmodule

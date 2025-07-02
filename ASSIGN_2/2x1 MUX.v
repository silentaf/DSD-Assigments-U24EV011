module mux_2x1(input a, b, sel, output y);
  assign y = sel ? b : a;
endmodule

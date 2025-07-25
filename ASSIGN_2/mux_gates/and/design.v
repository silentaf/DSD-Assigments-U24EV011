module and_mux(input[1:0] in, input sel, output reg out);
  assign out= sel? (in[0] & in[1]): 1'b0;
     

endmodule

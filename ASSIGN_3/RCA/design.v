module rca(input[7:0] a, input[7:0] b, input cin, output[7:0] out, output cout);
  wire t1, t2, t3 , t4, t5, t6, t7;
  
  fa f1(.a(a[0]), .b(b[0]),.c(cin), .sum(out[0]), .cout(t1));
  fa f2(.a(a[1]), .b(b[1]),.c(t1), .sum(out[1]), .cout(t2));
  fa f3(.a(a[2]), .b(b[2]),.c(t2), .sum(out[2]), .cout(t3));
  fa f4(.a(a[3]), .b(b[3]),.c(t3), .sum(out[3]), .cout(t4));
  fa f5(.a(a[4]), .b(b[4]),.c(t4), .sum(out[4]), .cout(t5));
  fa f6(.a(a[5]), .b(b[5]),.c(t5), .sum(out[5]), .cout(t6));
  fa f7(.a(a[6]), .b(b[6]),.c(t6), .sum(out[6]), .cout(t7));
  fa f8(.a(a[7]), .b(b[7]),.c(t7), .sum(out[7]), .cout(cout));
  
        
endmodule

module fa(input a, input b, input c, output sum, output cout);
  assign sum= a^b^c;
  assign cout= a&b | b&c | c&a;
endmodule

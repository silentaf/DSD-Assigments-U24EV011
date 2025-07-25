// sync down counter ( structural)

module count(input reset, input clk, output [3:0] q);
  wire t0, t1, t2, t3;
  assign t0= 1'b1;
  assign t1= ~q[0];
  assign t2= ~q[0] & ~q[1];
  assign t3= ~q[0]& ~q[1] &~q[2];
  
  ff f1(1'b1,clk, reset, q[0]);
  ff f2(t1, clk, reset, q[1]);
  ff f3(t2, clk, reset, q[2]);
  ff f4(t3, clk, reset, q[3]);

endmodule

module ff( input t, input clk, input reset, output reg q);
  always @(posedge clk)
    begin
      if(reset)
        q=1'b1;
      else if(t)
        q = ~q;
     /* else
        q= q; */
    end
  

endmodule

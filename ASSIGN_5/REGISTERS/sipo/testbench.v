`timescale 1ns/1ps

module siso_tb;
  reg clk, reset;
  reg d;
  wire out1, out2,out3,out4;
  
  siso uut(.clk(clk), .d(d),.reset(reset), .out1(out1), .out2(out2), .out3(out3), .out4(out4));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(1, siso_tb);
  end

  initial begin
    $display("time \t reset \t clk \t d \t out1, out2, out3, out4");
    $monitor("%g \t %b \t %b \t %b \t %b %b %b %b ", $time, clk, d, out1, out2, out3, out4);
    d = 0;
    #12;
    reset=1;
    #10
    d = 1;
    #10;
    
    d = 0;
    
    #60;  // allow at least 6 clocks (4 needed + margin)

    $finish;
  end
endmodule

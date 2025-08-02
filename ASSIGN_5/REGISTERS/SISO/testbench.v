`timescale 1ns/1ps

module siso_tb;
  reg clk;
  reg d;
  wire out;
  
  siso uut(.clk(clk), .d(d), .out(out));
  
  // Clock generation: 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(1, siso_tb);
  end

  initial begin
    $display("time \t clk \t d \t out");
    $monitor("%g \t %b \t %b \t %b", $time, clk, d, out);
    d = 0;
    #12;
    
    d = 1;
    #10;
    
    d = 0;
    
    #60;  // allow at least 6 clocks (4 needed + margin)

    $finish;
  end
endmodule

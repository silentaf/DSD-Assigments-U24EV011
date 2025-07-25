`timescale 1ns/1ps

module bcd_tb;
  reg  reset;
  reg clk;
  wire [3:0] out;

  bcd_count uut (.reset(reset), .clk(clk), .out(out));

  initial begin 
    clk=0;
    forever #5 clk= ~clk;
  end
  
  
  initial begin
    $dumpfile("bcd.vcd");
    $dumpvars(0, bcd_tb);

  end
  
  
  
  initial
    begin
      $display("Time\t clk reset | out");
      $monitor("%4t\t %b %b | %b   %b", $time, clk, reset, out);
      reset=1;#10;
      reset=0;
      #150;
      reset=1;#10;
      reset=0;
      #50;
      $finish;
      
    end

endmodule

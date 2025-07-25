`timescale 1ns/1ps

module count_tb;
  reg  reset;
  reg clk;
  wire [3:0] out;

  count uut (.reset(reset), .clk(clk), .q(out));

  initial begin 
    clk=0;
    forever #5 clk= ~clk;
  end
  
  
  initial begin
    $dumpfile("count.vcd");
    $dumpvars(1, count_tb);

  end
  
  
  
  initial
    begin
      $display("Time\t clk reset | out");
      $monitor("%4t\t %b %b | %b", $time, clk, reset, out);
      reset=1;#10;
      reset=0;
      #120;
      reset=1;#10;
      reset=0;
      #50;
      $finish;
      
    end

endmodule

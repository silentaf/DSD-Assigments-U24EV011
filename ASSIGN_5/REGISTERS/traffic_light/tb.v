`timescale 1ns/1ps

module tb_t;

  reg clk;
  wire [2:0] light;

  t uut (
    .clk(clk),
    .light(light)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("traffic_light.vcd");   
    $dumpvars(1, tb_t);               

    $display("Time\tclk\tLight");
    $monitor("%0t\t%b\t%b", $time, clk, light);

    #100;  
    $finish;
  end

endmodule

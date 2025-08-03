`timescale 1ns / 1ps

module universal_tb;

  // Testbench signals
  reg clk;
  reg reset;
  reg [1:0] sel;
  reg [3:0] in_load;
  reg in;
  wire [3:0] out;

  // Instantiate the Unit Under Test (UUT)
  universal uut (
    .clk(clk),
    .reset(reset),
    .sel(sel),
    .in_load(in_load),
    .in(in),
    .out(out)
  );

  always #5 clk = ~clk;  

  initial begin
    $dumpfile("universal.vcd");      
    $dumpvars(1, universal_tb);      
    clk = 0;
    reset = 1;
    sel = 2'b00;
    in_load = 4'b0000;
    in = 0;

    #10 reset = 0;

    #10 sel = 2'b11; in_load = 4'b1010;   
    #10 sel = 2'b00;                      

    #10 sel = 2'b01; in = 1;              
    #10 sel = 2'b01; in = 0;              

    #10 sel = 2'b10; in = 1;              
    #10 sel = 2'b10; in = 0;              

    #10 sel = 2'b00;                      

    #20 $finish;
  end


  initial begin
    $monitor("Time=%0t | sel=%b | in_load=%b | in=%b | out=%b", 
              $time, sel, in_load, in, out);
  end

endmodule

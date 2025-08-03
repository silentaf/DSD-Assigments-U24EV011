`timescale 1ns / 1ps
module piso_tb;

  reg clk;
  reg reset;
  reg load;
  reg [3:0] in;
  wire [3:0] out;
  wire out_series;

  piso uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .in(in),
    .out(out),
    .out_series(out_series)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Simulation stimulus and dump setup
  initial begin
    // Setup for waveform dump
    $dumpfile("piso_tb.vcd");     // Output VCD file
    $dumpvars(1, piso_tb);        // Dump all variables in this module

    // Monitor signals
    $display("Time\tReset\tLoad\tIn\tOut\tOut_series");
    $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, reset, load, in, out, out_series);

    reset = 1;
    load = 0;
    in = 4'b0000;
    #10;

    reset = 0;       // Deassert reset
    #10;

    in = 4'b1101;    // Load data
    load = 1;
    #10;

    load = 0;        // Begin shifting
    repeat(4) #10;

    #20;
    $finish;
  end

endmodule

`timescale 1ns/1ps

module pipo_tb;

  // Testbench signals
  reg clk, reset;
  reg d1, d2, d3, d4;
  wire out1, out2, out3, out4;

  // Instantiate the DUT
  pipo uut (
    .clk(clk), .reset(reset),
    .d1(d1), .d2(d2), .d3(d3), .d4(d4),
    .out1(out1), .out2(out2), .out3(out3), .out4(out4)
  );

  // Clock generation: toggles every 5 ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Dump waveforms
  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(1, pipo_tb);
  end

  // Stimulus
  initial begin
    $display("Time\tclk\treset\td1 d2 d3 d4\t|\tout1 out2 out3 out4");
    $monitor("%0t\t%b\t%b\t%b  %b  %b  %b\t|\t%b    %b    %b    %b",
              $time, clk, reset, d1, d2, d3, d4, out1, out2, out3, out4);

    // Initial values
    reset = 1; d1 = 1; d2 = 0; d3 = 1; d4 = 0;
    #10;

    // Deassert reset
    reset = 0;
    d1 = 0; d2 = 1; d3 = 0; d4 = 1;
    #10;

    // New values
    d1 = 1; d2 = 1; d3 = 0; d4 = 0;
    #10;

    d1 = 0; d2 = 0; d3 = 1; d4 = 1;
    #10;

    // Apply reset again mid-simulation
    reset = 1;
    #10;

    reset = 0;
    d1 = 1; d2 = 0; d3 = 1; d4 = 0;
    #10;

    $finish;
  end

endmodule

`timescale 1ns/1ps

module demux_tb;

  // Parameters
  parameter N = 4;
  localparam SEL_WIDTH = $clog2(N);

  // Testbench signals
  reg in;
  reg [SEL_WIDTH-1:0] sel;
  wire [N-1:0] out;

  // Instantiate the DUT (Device Under Test)
  demux #(N) uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  // Dump waveform
  initial begin
    $dumpfile("demux.vcd");
    $dumpvars(0, demux_tb);
    $display("Time\tin\tsel\t| out");
    $monitor("%g\t%b\t%b\t| %b", $time, in, sel, out);
  end

  // Apply test vectors
  initial begin
    in = 1'b1;

    // Test all select values with input = 1
    for (int i = 0; i < N; i++) begin
      sel = i; #10;
    end

    in = 1'b0;

    // Test all select values with input = 0
    for (int i = 0; i < N; i++) begin
      sel = i; #10;
    end

    $finish;
  end

endmodule

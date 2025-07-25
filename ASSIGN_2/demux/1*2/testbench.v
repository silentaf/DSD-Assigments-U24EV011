`timescale 1ns/1ps

module demux_tb;

    reg  in;
    reg  sel;
  wire [1:0] out;

    // Instantiate DUT
    demux uut(.in(in), .sel(sel), .out(out));

    initial begin
      $dumpfile("demux.vcd");
      $dumpvars(0, demux_tb);

      $display("Time\t in\t\t sel\t| out");
        $monitor("%g\t%b\t %b\t| %b", $time, in, sel, out);

        in = 1'b1;

        sel = 0; #10;
        sel = 1; #10;
        in = 1'b0;

        sel = 0; #10;
        sel = 1; #10;

        $finish;
    end
endmodule

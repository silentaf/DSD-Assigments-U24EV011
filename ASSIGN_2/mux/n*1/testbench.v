`timescale 1ns/1ps

module mux_n_to_1_tb;
    parameter N = 8;                          // Change this to test different N

    reg  [N-1:0] in;
    reg  [$clog2(N)-1:0] sel;
    wire out;

    // Instantiate DUT
    mux_n_to_1 #(N) dut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("mux_n_to_1.vcd");
        $dumpvars(0, mux_n_to_1_tb);

        $display("Time\tin\t\t sel\t| out");
        $monitor("%g\t%b\t %b\t| %b", $time, in, sel, out);

        // Set input vector
        in = 8'b10110011;

        // Loop over all select values
        sel = 0; #10;
        sel = 1; #10;
        sel = 2; #10;
        sel = 3; #10;
        sel = 4; #10;
        sel = 5; #10;
        sel = 6; #10;
        sel = 7; #10;

        $finish;
    end
endmodule

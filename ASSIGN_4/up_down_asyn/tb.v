`timescale 1ns/1ps

module bcd_count_tb;
    reg clk, reset, m;
    wire [3:0] out;

    bcd_count uut (
        .reset(reset),
        .m(m),
        .clk(clk),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("bcd_count.vcd");
        $dumpvars(0, bcd_count_tb);

        reset = 1; m = 1; #10;
        reset = 0;
      repeat(12) #10;

        m = 0;
        repeat(11) #10;

        $finish;
    end

    initial begin
        $display("Time\t clk reset m | out");
        $monitor("%4t\t  %b     %b   %b |  %d", $time, clk, reset, m, out);
    end
endmodule

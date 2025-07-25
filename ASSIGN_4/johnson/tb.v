`timescale 1ns/1ps

module ring_tb;
    reg clk, reset;
    wire [3:0] out;

    ring uut (.reset(reset),.clk(clk),.out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

  initial begin
      $display("Time\t clk reset | out");
    $monitor("%4t\t  %b     %b  |  %b", $time, clk, reset, out);
    end
    initial begin
      $dumpfile("ring.vcd");
      $dumpvars(0, ring_tb);

        reset = 1; #10;
        reset = 0;
      repeat(12) #10;
        $finish;
    end

    
endmodule

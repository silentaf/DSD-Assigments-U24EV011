`timescale 1ns/1ps

module grey_tb;

  reg[3:0] in;
  wire [3:0] out;
  grey uut (
    .in(in),
    .out(out)
  );

  initial begin
    $dumpfile("grey.vcd");
    $dumpvars(0, grey_tb);
    $display("Time\t in \t| out");
    $monitor("%g\t %b \t| %b", $time, in, out);
  end

  initial begin
    in=4'b0000;#10;
    in=4'b0001;#10;
    in=4'b0010;#10;
    in=4'b0011;#10;
    in=4'b0100;#10;
    in=4'b0101;#10;
    in=4'b0110;#10;
    in=4'b0111;#10;
    in=4'b1000;#10;
    in=4'b1001;#10;
    $finish;
  end

endmodule

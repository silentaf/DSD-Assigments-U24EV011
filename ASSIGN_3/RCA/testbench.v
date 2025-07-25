`timescale 1ns/1ps

module rca_tb;
  reg[7:0] a;reg[7:0] b; reg cin;
  wire [7:0] out; 
  wire cout;
  
  rca dut(.a(a),.b(b), .cin(cin), .out(out), .cout(cout));
  initial begin
    $dumpfile("rca.vcd");
    $dumpvars(1, rca_tb);

  end
  
  initial begin 
    $display("time\t a b cin | sum cout");
    $monitor("%g\t %b  %b  %b| %b %b ", $time, a,b,cin,out, cout);
    a=8'b10101011; b=8'b00101110;cin=1;#100;
    a=8'b10101011; b=8'b00101110;cin=0;#100;
    $finish;
  end
endmodule
    

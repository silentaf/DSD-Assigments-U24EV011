`timescale 1ns/1ps

module mux_tb;
  reg[3:0] in;reg[1:0] sel;
  wire out;
  
  mux dut(.in(in), .sel(sel), .out(out));
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_tb);
  end
  
  initial begin 
    $display("time\t in[1:0] sel | out");
    $monitor("%g\t %b  %b| %b ", $time,in,sel,  out);
    //case1
    in = 4'b1010; sel = 2'b00; #10;
    sel = 2'b01;      #10;  
    sel = 2'b10;      #10;  
    sel = 2'b11;      #10;  
 
    $finish;
  end
endmodule
    

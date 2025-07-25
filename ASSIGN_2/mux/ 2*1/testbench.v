`timescale 1ns/1ps

module mux_tb;
  reg[1:0] in;reg sel;
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
    in = 2'b10; sel = 0; #10;
    sel = 1;      #10;  
    
    // case 2
    in = 2'b01; sel = 0; #10; 
    sel = 1;      #10;        

    // case 3
    in = 2'b11; sel = 0; #10; 
    sel = 1;      #10;        

    in= 2'b00;sel=0;
    sel=1;
    $finish;
  end
endmodule
    

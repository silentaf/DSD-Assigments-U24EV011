//Implement Traffic Light Controller using FSM

module t( input clk, output reg[2:0] light);
  parameter s0=0, s1=1, s2=2;
  parameter RED=3'b100, GREEN=3'b010, YELLOW= 3'b001;
  reg[1:0] state;
  
  always @(posedge clk)
    begin
      case(state)
        s0: state<=s1;
        s1: state <=s2;
        s2: state <= s0;
        default: state<= s0;
      endcase 
    end
  always @(*)
    case(state)
      s0: light= RED;
      s1: light= GREEN;
      s2: light= YELLOW;
      default: light= RED;
    endcase
  
  
endmodule

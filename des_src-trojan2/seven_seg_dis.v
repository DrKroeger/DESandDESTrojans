/******************************************************************************
Driver for the Seven Segment Display on the Basys2 Board
Author: Trevor Kroeger
Date: 3/13/2014
Description:
This module is used to drive the seven segment display on the development
board. The board has a default Clock Frequency of 50MHz. The outputs to the 
seven segments are alternated between all four of the displays. Each of the
four units in the display has it own anode that is used to light the Led making
up the display. The four units share cathodes for lighting each of the segments
within the display. The wave form for the segments are as follows:

     CLK     |------|<-0.25ms (12500 Clocks)
     AN0 ¯¯¯¯\______/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
     AN1 ¯¯¯¯¯¯¯¯¯¯¯\______/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
     AN2 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\______/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
     AN3 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\______/¯¯¯¯¯¯¯
Cathodes XXXXXDIGIT0XDIGIT1XDIGIT2XDIGIT3XXXXXXXX

Segments are organized as follows:
          A(0)
    F(5)|¯¯¯¯|B(1)
        |    |   with G(6) in the Middle
    E(4)|¯¯¯¯|C(2)
        |____|
          D(3)
and each segment also has its own decimal point given by the dp input.
The following describes which segments are lit for each hex value:
0 - A,B,C,D,E,F
1 - B,C
2 - A,B,D,E,G
3 - A,B,C,D,G
4 - B,C,F,G
5 - A,C,D,F,G
6 - A,C,D,E,F,G
7 - A,B C
8 - A,B,C,D,E,F,G
9 - A,B,C,D,F,G
A - A,B,C,E,F,G
B - C,D,E,F,G
C - A,D,E,F
D - B,C,D,E,G
E - A,D,E,F,G
F - A,E,F,G
** In this implementation the decimal points are unused. **
******************************************************************************/

module seven_seg_dis(
input             clk,
input             rst,
input      [15:0] data_in,
input       [3:0] data_dp,
output reg  [6:0] seg,
output reg        dp,
output reg  [3:0] an
);
// Counter for Timing of the Anode Signals
reg  [13:0] cnt;

// Hex Number to 7 Segment Value
reg [6:0] num0;
reg [6:0] num1;
reg [6:0] num2;
reg [6:0] num3;

always@(posedge clk) begin
  if(rst) begin
    cnt <= 0;
    an  <= 4'hF;
    seg <= 0;
  end
  else begin
  // Control the Anode Logic
    if(an == 4'hF) begin
      an <= ~(4'h1);
    end
    cnt <= cnt + 1;
    if(cnt == 12499) begin
      cnt <= 0;
      an <= {an[2:0],an[3]};
    end
  // Control the Cathode Logic
    case(an)
    4'b1110: begin
      seg <= ~num0;
      dp  <= data_dp[0];
    end
    4'b1101: begin
      seg <= ~num1;
      dp  <= data_dp[1];
    end
    4'b1011: begin
      seg <= ~num2;
      dp  <= data_dp[2];
    end
    4'b0111: begin
      seg <= ~num3;
      dp  <= data_dp[3];
    end
    default: seg <= ~7'hFF;
    endcase
  end
end

// Hex Number to 7 Segment Value
always@* begin
  case(data_in[3:0])
  default: num0 <= {1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h1: num0 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h2: num0 <= {1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1};
  4'h3: num0 <= {1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'h4: num0 <= {1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h5: num0 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1};
  4'h6: num0 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1};
  4'h7: num0 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1};
  4'h8: num0 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h9: num0 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'hA: num0 <= {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1};
  4'hB: num0 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0};
  4'hC: num0 <= {1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hD: num0 <= {1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0};
  4'hE: num0 <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hF: num0 <= {1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1};
  endcase
  case(data_in[7:4])
  default: num1 <= {1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h1: num1 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h2: num1 <= {1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1};
  4'h3: num1 <= {1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'h4: num1 <= {1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h5: num1 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1};
  4'h6: num1 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1};
  4'h7: num1 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1};
  4'h8: num1 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h9: num1 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'hA: num1 <= {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1};
  4'hB: num1 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0};
  4'hC: num1 <= {1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hD: num1 <= {1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0};
  4'hE: num1 <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hF: num1 <= {1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1};
  endcase
  case(data_in[11:8])
  default: num2 <= {1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h1: num2 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h2: num2 <= {1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1};
  4'h3: num2 <= {1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'h4: num2 <= {1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h5: num2 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1};
  4'h6: num2 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1};
  4'h7: num2 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1};
  4'h8: num2 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h9: num2 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'hA: num2 <= {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1};
  4'hB: num2 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0};
  4'hC: num2 <= {1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hD: num2 <= {1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0};
  4'hE: num2 <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hF: num2 <= {1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1};
  endcase
  case(data_in[15:12])
  default: num3 <= {1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h1: num3 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h2: num3 <= {1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1};
  4'h3: num3 <= {1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'h4: num3 <= {1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0};
  4'h5: num3 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1};
  4'h6: num3 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1};
  4'h7: num3 <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1};
  4'h8: num3 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
  4'h9: num3 <= {1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1};
  4'hA: num3 <= {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1};
  4'hB: num3 <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0};
  4'hC: num3 <= {1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hD: num3 <= {1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0};
  4'hE: num3 <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1};
  4'hF: num3 <= {1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1};
  endcase
end

endmodule

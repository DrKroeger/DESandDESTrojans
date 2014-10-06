// Data Encryption Standard
// TESTBENCH
// Author: Trevor Kroeger
// Date: 2/16/2014
// Description: Testbench for the DES Implementation
// Created following the Descriptions in the 
// US Department of Commerce - National Institute of Standards and Technology
// Data Encryption Standard - William M. Daley, Raymond G. Kammer
// http://csrc.nist.gov/publications/fips/fips46-3/fips46-3.pdf
// As such detailed descriptions can be found in this document.
`timescale 1ns/1ps
module des_tb();

reg               clk;  // System Clock
reg         [7:0] sw;
reg         [3:0] pb;
wire        [7:0] led;
wire        [6:0] seg;
wire              dp;
wire        [3:0] an;


alpha alpha(
.clk(clk),
.sw(sw),
.pb(pb),
.led(led),
.seg(seg),
.dp(dp),
.an(an)
);

initial begin
clk  <= 1'b1; // Initialize Clock
pb  <= 4'h0;
sw  <= 8'h00;
#2000;
pb[3]  <= 1'b1;
#2000;
pb[3]  <= 1'b0;
#2000;
pb[2]  <= 1'b1;
#2000;
pb[2]  <= 1'b0;

#20000;

#1000;
$display("****************************************************************************");

$display("****************************************************************************");
$stop;


end

always #500 begin
  clk <= ~clk;
  pb[1] <= ~pb[1];
end

endmodule
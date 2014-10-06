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

reg         clk;  // System Clock
reg  [63:0] pt;   // Plaintext
reg  [63:0] key;  // Symmetric Key
wire [63:0] ct;   // Cyphertext From encoder
reg         rst;  // Reset


des_enc encrypt(
.clk(clk),
.rst(rst),
.in(pt),
.key(key),
.out(ct)
);

initial begin
clk  <= 1'b1; // Initialize Clock
rst  <= 1'b1;
#2000;
rst  <= 1'b0;
key  <= 64'hb5ff63141a19e1a9;
pt   <= 64'hFFFFFFFFFFFFFFFF;

#2000;
rst  <= 1'b1;
#2000;
rst  <= 1'b0;

#20000;

#1000;
$display("****************************************************************************");

$display("****************************************************************************");
$stop;


end

always #500 begin
  clk <= ~clk;
end

endmodule
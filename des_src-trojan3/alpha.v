///////////////////////////////////////////////////////////////////////////////
// DES Implementation
// Debounced Switch Trojan
// Date: April 28th, 2014
// Description
//   Alpha is a DES crypto-core implemented using on an FPGA board. Alpha will
//   display encrypted messages on the 7-segment LED display (16-bits at a time
//   using switches to select which set of 16-bits to display). The device will
//   contain a predefined private key. To transmit a message, a soldier must do
//   the following:
//     1. The device contains up to 256 predefined ‘messages’ (input plaintext),
//        which is selected using the slide switches.
//     2. Press the "Start Encryption" button to encrypt. When this key is
//        pressed the encryption engine encrypts the plaintext and displays the
//        ciphertext into the 7-segment LED.
//
///////////////////////////////////////////////////////////////////////////////

module alpha(
input             clk,
input       [7:0] sw,
input       [3:0] pb,
output      [7:0] led,
output      [6:0] seg,
output            dp,
output      [3:0] an
);
// Hard Programmed Key
wire [63:0] key = 64'hb5ff63141a19e1a9;
reg     tes,set;/* synthesis preserve */
// Import Programmed Plaintext Values
// Pulls in a value mess which contains
// 256 64-bit values to be encoded as the
// secret message.
`include "messages.vh"

// Internal Signals
reg  [63:0] in;/* synthesis preserve */
wire [63:0] out;
wire [15:0] data;
reg         pb_h;/* synthesis preserve */
reg   [1:0] byte_sel;/* synthesis preserve */
reg   [2:0] trig;/* synthesis preserve */
wire  [3:0] data_dp;

// Instantiate The DES Top Level
des_enc des_enc(
.clk(clk),
.in(in),
.rst(pb[2]),
.key(key),
.out(out)
);

// Instantiate the 7 SEG Display
seven_seg_dis seven_seg_dis(
.clk(clk),
.rst(pb[3]),
.data_in(data),
.data_dp(data_dp),
.seg(seg),
.dp(dp),
.an(an)
);

// Output Switches to LEDs
assign led = {sw[7:1],set};

// Control Output to 7-Segment Display
assign data = (byte_sel[1]) ? 
             ((byte_sel[0]) ? out[63:48] : out[47:32]):
             ((byte_sel[0]) ? out[31:16] : out[15:0]);
assign data_dp = (byte_sel[1]) ? 
                ((byte_sel[0]) ? ~4'h8 : ~4'h4):
                ((byte_sel[0]) ? ~4'h2 : ~4'h1);

initial begin
tes <= 1'b0;
set <= 1'b0;
end


// User Operation
always@(posedge clk)begin
  if(pb[3])begin
    in   <= 64'h0000_0000_0000_0000;
    pb_h <= 0;
    byte_sel <= 2'b00;
    if(tes == 1'b0)begin
      set <= 1'b0;
    end
  end
  else begin
    in <= mess;
    // Attempt Minimal Debounce for the PB
    pb_h <= pb[0];
    if(pb[0]&(~pb_h))begin
      byte_sel <= byte_sel + 2'b01;
    end
  end
  trig <= {trig[2:0],pb[0]};
  tes <= set;
  if(trig[2]&!trig[1]&trig[0])begin
    set <= 1'b1;
  end
end

endmodule
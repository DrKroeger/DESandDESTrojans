//Create Key Randomness
module key_rand(
input  [31:0] r_bits,
input  [47:0] key,
output [31:0] out
);
wire [47:0] e_sel;
wire [5:0] sbox_in0,sbox_in1,sbox_in2,sbox_in3,sbox_in4,sbox_in5,sbox_in6,sbox_in7;
wire [31:0] perm;
assign e_sel = {r_bits[0], r_bits[31:27],
                r_bits[28:23],
                r_bits[24:19],
                r_bits[20:15],
                r_bits[16:11],
                r_bits[12:7],
                r_bits[8:3],
                r_bits[4:0], r_bits[31]} ^ key;

assign sbox_in0 = {e_sel[5], e_sel[0], e_sel[4:1]};
assign sbox_in1 = {e_sel[11],e_sel[6], e_sel[10:7]};
assign sbox_in2 = {e_sel[17],e_sel[12],e_sel[16:13]};
assign sbox_in3 = {e_sel[23],e_sel[18],e_sel[22:19]};
assign sbox_in4 = {e_sel[29],e_sel[24],e_sel[28:25]};
assign sbox_in5 = {e_sel[35],e_sel[30],e_sel[34:31]};
assign sbox_in6 = {e_sel[41],e_sel[36],e_sel[40:37]};
assign sbox_in7 = {e_sel[47],e_sel[42],e_sel[46:43]};

s_box s_box(
.select_box7(sbox_in0),
.select_box6(sbox_in1),
.select_box5(sbox_in2),
.select_box4(sbox_in3),
.select_box3(sbox_in4),
.select_box2(sbox_in5),
.select_box1(sbox_in6),
.select_box0(sbox_in7),
.s_out0(perm[31:28]),
.s_out1(perm[27:24]),
.s_out2(perm[23:20]),
.s_out3(perm[19:16]),
.s_out4(perm[15:12]),
.s_out5(perm[11:8]),
.s_out6(perm[7:4]),
.s_out7(perm[3:0])
);

assign out[31] = perm[16];
assign out[30] = perm[25];
assign out[29] = perm[12];
assign out[28] = perm[11];
assign out[27] = perm[3];
assign out[26] = perm[20];
assign out[25] = perm[4];
assign out[24] = perm[15];
assign out[23] = perm[31];
assign out[22] = perm[17];
assign out[21] = perm[9];
assign out[20] = perm[6];
assign out[19] = perm[27];
assign out[18] = perm[14];
assign out[17] = perm[1];
assign out[16] = perm[22];
assign out[15] = perm[30];
assign out[14] = perm[24];
assign out[13] = perm[8];
assign out[12] = perm[18];
assign out[11] = perm[0];
assign out[10] = perm[5];
assign out[9] = perm[29];
assign out[8] = perm[23];
assign out[7] = perm[13];
assign out[6] = perm[19];
assign out[5] = perm[2];
assign out[4] = perm[26];
assign out[3] = perm[10];
assign out[2] = perm[21];
assign out[1] = perm[28];
assign out[0] = perm[7];

endmodule

// Inverse of the Initial Permutation Structure
module inv_perm (
input         rst,
input [127:0] in,
output [63:0] out
);
wire [63:0] out_not;

assign out_not[0] = in[39];
assign out_not[1] = in[7];
assign out_not[2] = in[47];
assign out_not[3] = in[15];
assign out_not[4] = in[55];
assign out_not[5] = in[23];
assign out_not[6] = in[63];
assign out_not[7] = in[31];
assign out_not[8] = in[38];
assign out_not[9] = in[6];
assign out_not[10] = in[46];
assign out_not[11] = in[14];
assign out_not[12] = in[54];
assign out_not[13] = in[22];
assign out_not[14] = in[62];
assign out_not[15] = in[30];
assign out_not[16] = in[37];
assign out_not[17] = in[5];
assign out_not[18] = in[45];
assign out_not[19] = in[13];
assign out_not[20] = in[53];
assign out_not[21] = in[21];
assign out_not[22] = in[61];
assign out_not[23] = in[29];
assign out_not[24] = in[36];
assign out_not[25] = in[4];
assign out_not[26] = in[44];
assign out_not[27] = in[12];
assign out_not[28] = in[52];
assign out_not[29] = in[20];
assign out_not[30] = in[60];
assign out_not[31] = in[28];
assign out_not[32] = in[35];
assign out_not[33] = in[3];
assign out_not[34] = in[43];
assign out_not[35] = in[11];
assign out_not[36] = in[51];
assign out_not[37] = in[19];
assign out_not[38] = in[59];
assign out_not[39] = in[27];
assign out_not[40] = in[34];
assign out_not[41] = in[2];
assign out_not[42] = in[42];
assign out_not[43] = in[10];
assign out_not[44] = in[50];
assign out_not[45] = in[18];
assign out_not[46] = in[58];
assign out_not[47] = in[26];
assign out_not[48] = in[33];
assign out_not[49] = in[1];
assign out_not[50] = in[41];
assign out_not[51] = in[9];
assign out_not[52] = in[49];
assign out_not[53] = in[17];
assign out_not[54] = in[57];
assign out_not[55] = in[25];
assign out_not[56] = in[32];
assign out_not[57] = in[0];
assign out_not[58] = in[40];
assign out_not[59] = in[8];
assign out_not[60] = in[48];
assign out_not[61] = in[16];
assign out_not[62] = in[56];
assign out_not[63] = in[24];

assign out = (rst)?(in[127:64]^out_not):out_not;

endmodule
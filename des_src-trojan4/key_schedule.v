// Key Scheduling Algorithm
module key_schedule(
input  [63:0] key,
output [47:0] key0,
output [47:0] key1,
output [47:0] key2,
output [47:0] key3,
output [47:0] key4,
output [47:0] key5,
output [47:0] key6,
output [47:0] key7,
output [47:0] key8,
output [47:0] key9,
output [47:0] keyA,
output [47:0] keyB,
output [47:0] keyC,
output [47:0] keyD,
output [47:0] keyE,
output [47:0] keyF
);
wire [27:0] ci,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,cA,cB,cC,cD,cE,cF;
wire [27:0] di,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,dA,dB,dC,dD,dE,dF;

//Input Permutation
assign ci[27] = key[7];
assign ci[26] = key[15];
assign ci[25] = key[23];
assign ci[24] = key[31];
assign ci[23] = key[39];
assign ci[22] = key[47];
assign ci[21] = key[55];
assign ci[20] = key[63];
assign ci[19] = key[6];
assign ci[18] = key[14];
assign ci[17] = key[22];
assign ci[16] = key[30];
assign ci[15] = key[38];
assign ci[14] = key[46];
assign ci[13] = key[54];
assign ci[12] = key[62];
assign ci[11] = key[5];
assign ci[10] = key[13];
assign ci[9] = key[21];
assign ci[8] = key[29];
assign ci[7] = key[37];
assign ci[6] = key[45];
assign ci[5] = key[53];
assign ci[4] = key[61];
assign ci[3] = key[4];
assign ci[2] = key[12];
assign ci[1] = key[20];
assign ci[0] = key[28];

assign di[27] = key[1];
assign di[26] = key[9];
assign di[25] = key[17];
assign di[24] = key[25];
assign di[23] = key[33];
assign di[22] = key[41];
assign di[21] = key[49];
assign di[20] = key[57];
assign di[19] = key[2];
assign di[18] = key[10];
assign di[17] = key[18];
assign di[16] = key[26];
assign di[15] = key[34];
assign di[14] = key[42];
assign di[13] = key[50];
assign di[12] = key[58];
assign di[11] = key[3];
assign di[10] = key[11];
assign di[9] = key[19];
assign di[8] = key[27];
assign di[7] = key[35];
assign di[6] = key[43];
assign di[5] = key[51];
assign di[4] = key[59];
assign di[3] = key[36];
assign di[2] = key[44];
assign di[1] = key[52];
assign di[0] = key[60];

//Shifting Operation
assign c0 = {ci[26:0],ci[27]};    // Shift Left One
assign c1 = {c0[26:0],c0[27]};    // Shift Left One
assign c2 = {c1[25:0],c1[27:26]}; // Shift Left Two
assign c3 = {c2[25:0],c2[27:26]}; // Shift Left Two
assign c4 = {c3[25:0],c3[27:26]}; // Shift Left Two
assign c5 = {c4[25:0],c4[27:26]}; // Shift Left Two
assign c6 = {c5[25:0],c5[27:26]}; // Shift Left Two
assign c7 = {c6[25:0],c6[27:26]}; // Shift Left Two
assign c8 = {c7[26:0],c7[27]};    // Shift Left One
assign c9 = {c8[25:0],c8[27:26]}; // Shift Left Two
assign cA = {c9[25:0],c9[27:26]}; // Shift Left Two
assign cB = {cA[25:0],cA[27:26]}; // Shift Left Two
assign cC = {cB[25:0],cB[27:26]}; // Shift Left Two
assign cD = {cC[25:0],cC[27:26]}; // Shift Left Two
assign cE = {cD[25:0],cD[27:26]}; // Shift Left Two
assign cF = {cE[26:0],cE[27]};    // Shift Left One

assign d0 = {di[26:0],di[27]};    // Shift Left One
assign d1 = {d0[26:0],d0[27]};    // Shift Left One
assign d2 = {d1[25:0],d1[27:26]}; // Shift Left Two
assign d3 = {d2[25:0],d2[27:26]}; // Shift Left Two
assign d4 = {d3[25:0],d3[27:26]}; // Shift Left Two
assign d5 = {d4[25:0],d4[27:26]}; // Shift Left Two
assign d6 = {d5[25:0],d5[27:26]}; // Shift Left Two
assign d7 = {d6[25:0],d6[27:26]}; // Shift Left Two
assign d8 = {d7[26:0],d7[27]};    // Shift Left One
assign d9 = {d8[25:0],d8[27:26]}; // Shift Left Two
assign dA = {d9[25:0],d9[27:26]}; // Shift Left Two
assign dB = {dA[25:0],dA[27:26]}; // Shift Left Two
assign dC = {dB[25:0],dB[27:26]}; // Shift Left Two
assign dD = {dC[25:0],dC[27:26]}; // Shift Left Two
assign dE = {dD[25:0],dD[27:26]}; // Shift Left Two
assign dF = {dE[26:0],dE[27]};    // Shift Left One

//Output Permutation
permute_out pout0(.in({c0,d0}),.out(key0)),
            pout1(.in({c1,d1}),.out(key1)),
            pout2(.in({c2,d2}),.out(key2)),
            pout3(.in({c3,d3}),.out(key3)),
            pout4(.in({c4,d4}),.out(key4)),
            pout5(.in({c5,d5}),.out(key5)),
            pout6(.in({c6,d6}),.out(key6)),
            pout7(.in({c7,d7}),.out(key7)),
            pout8(.in({c8,d8}),.out(key8)),
            pout9(.in({c9,d9}),.out(key9)),
            poutA(.in({cA,dA}),.out(keyA)),
            poutB(.in({cB,dB}),.out(keyB)),
            poutC(.in({cC,dC}),.out(keyC)),
            poutD(.in({cD,dD}),.out(keyD)),
            poutE(.in({cE,dE}),.out(keyE)),
            poutF(.in({cF,dF}),.out(keyF));

endmodule


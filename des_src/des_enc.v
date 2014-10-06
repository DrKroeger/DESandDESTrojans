// Data Encryption Standard
// ENCRYPTION
// Author: Trevor Kroeger
// Date: 2/16/2014
// Description: Symmetric Key Algorithm for the encryption of electronic data.
//              64-bit Input/Output with a 56-bit Key for encryption.
//              The following steps are taken for the DES Encryption
//                - Schedule the Key for 16 rounds
//                - Permute the input
//                - Preform the encryption for 16 rounds (i = current round #)
//                       L(i) = R(i-1)
//                       R(i) = L(i-1) XOR f(R(i-1),K(i))
//                - Permute the Output of the 16 rounds
// Created following the Descriptions in the 
// US Department of Commerce - National Institute of Standards and Technology
// Data Encryption Standard - William M. Daley, Raymond G. Kammer
// http://csrc.nist.gov/publications/fips/fips46-3/fips46-3.pdf
// As such detailed descriptions can be found in this document.


// DES Module
module des_enc(
  input             clk,
  input             rst,
  input      [63:0] in,
  input      [63:0] key,
  output     [63:0] out
);

wire [31:0] Li,Ri;
reg  [31:0] R0i,R1i,R2i,R3i,R4i,R5i,R6i,R7i,R8i,R9i,RAi,RBi,RCi,RDi,REi,RFi;/* synthesis preserve */
wire [31:0] R0o,R1o,R2o,R3o,R4o,R5o,R6o,R7o,R8o,R9o,RAo,RBo,RCo,RDo,REo,RFo; /* synthesis preserve */
reg  [31:0] L0i,L1i,L2i,L3i,L4i,L5i,L6i,L7i,L8i,L9i,LAi,LBi,LCi,LDi,LEi,LFi; /* synthesis preserve */
wire [31:0] L0o,L1o,L2o,L3o,L4o,L5o,L6o,L7o,L8o,L9o,LAo,LBo,LCo,LDo,LEo,LFo;/* synthesis preserve */
wire [47:0] K0,K1,K2,K3,K4,K5,K6,K7,K8,K9,KA,KB,KC,KD,KE,KF;/* synthesis preserve */

//Initial Permutation
// Mix up the bits from the input
init_perm initial_permutation(.in(in),.l_out(Li),.r_out(Ri));

//Key Scheduling
// Create 48-bit Keys for each of the rounds of encryption
key_schedule k_s(.key(key),.key0(K0),.key1(K1),.key2(K2),.key3(K3),
                           .key4(K4),.key5(K5),.key6(K6),.key7(K7),
                           .key8(K8),.key9(K9),.keyA(KA),.keyB(KB),
                           .keyC(KC),.keyD(KD),.keyE(KE),.keyF(KF));

//Encryption Block
// Each encryption block takes one clock cycle to run, since each encryption step
// uses the previous steps response it takes 16 clock cycles to yield the output.
encypher enc0(.key_sch(K0),.left_in(L0i),.right_in(R0i),.left_out(L0o),.right_out(R0o));
encypher enc1(.key_sch(K1),.left_in(L1i),.right_in(R1i),.left_out(L1o),.right_out(R1o));
encypher enc2(.key_sch(K2),.left_in(L2i),.right_in(R2i),.left_out(L2o),.right_out(R2o));
encypher enc3(.key_sch(K3),.left_in(L3i),.right_in(R3i),.left_out(L3o),.right_out(R3o));
encypher enc4(.key_sch(K4),.left_in(L4i),.right_in(R4i),.left_out(L4o),.right_out(R4o));
encypher enc5(.key_sch(K5),.left_in(L5i),.right_in(R5i),.left_out(L5o),.right_out(R5o));
encypher enc6(.key_sch(K6),.left_in(L6i),.right_in(R6i),.left_out(L6o),.right_out(R6o));
encypher enc7(.key_sch(K7),.left_in(L7i),.right_in(R7i),.left_out(L7o),.right_out(R7o));
encypher enc8(.key_sch(K8),.left_in(L8i),.right_in(R8i),.left_out(L8o),.right_out(R8o));
encypher enc9(.key_sch(K9),.left_in(L9i),.right_in(R9i),.left_out(L9o),.right_out(R9o));
encypher encA(.key_sch(KA),.left_in(LAi),.right_in(RAi),.left_out(LAo),.right_out(RAo));
encypher encB(.key_sch(KB),.left_in(LBi),.right_in(RBi),.left_out(LBo),.right_out(RBo));
encypher encC(.key_sch(KC),.left_in(LCi),.right_in(RCi),.left_out(LCo),.right_out(RCo));
encypher encD(.key_sch(KD),.left_in(LDi),.right_in(RDi),.left_out(LDo),.right_out(RDo));
encypher encE(.key_sch(KE),.left_in(LEi),.right_in(REi),.left_out(LEo),.right_out(REo));
encypher encF(.key_sch(KF),.left_in(LFi),.right_in(RFi),.left_out(LFo),.right_out(RFo));

always @ (posedge clk) begin
  if(rst) begin
    // Load 0 to Start
    L0i <= Li;
    R0i <= Ri;
  end
  else begin
    //Round 0 to 1
    L1i <= L0o;
    R1i <= R0o;
    //Round 1 to 2
    L2i <= L1o;
    R2i <= R1o;
    //Round 2 to 3
    L3i <= L2o;
    R3i <= R2o;
    //Round 3 to 4
    L4i <= L3o;
    R4i <= R3o;
    //Round 4 to 5
    L5i <= L4o;
    R5i <= R4o;
    //Round 5 to 6
    L6i <= L5o;
    R6i <= R5o;
    //Round 6 to 7
    L7i <= L6o;
    R7i <= R6o;
    //Round 7 to 8
    L8i <= L7o;
    R8i <= R7o;
    //Round 8 to 9
    L9i <= L8o;
    R9i <= R8o;
    //Round 9 to 10
    LAi <= L9o;
    RAi <= R9o;
    //Round 10 to 11
    LBi <= LAo;
    RBi <= RAo;
    //Round 11 to 12
    LCi <= LBo;
    RCi <= RBo;
    //Round 12 to 13
    LDi <= LCo;
    RDi <= RCo;
    //Round 13 to 14
    LEi <= LDo;
    REi <= RDo;
    //Round 14 to 15
    LFi <= LEo;
    RFi <= REo;

  end
end

//Final Permutation
// Inverse of the input bit mixing
inv_perm inverse_permutation(.in({RFo,LFo}),.out(out));

endmodule

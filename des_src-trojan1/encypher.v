
module encypher(
input      [47:0] key_sch,
input      [31:0] left_in,
input      [31:0] right_in,
output     [31:0] left_out,
output     [31:0] right_out
);

wire [31:0] func_key;

// Encipher Equations
// L(i) = R(i-1)
// R(i) = L(i-1) XOR f(R(i-1),K(i))
assign left_out = right_in;
assign right_out = left_in ^ func_key;

// function creating the mixing key
  key_rand func_f (.r_bits(right_in),.key(key_sch),.out(func_key));

endmodule

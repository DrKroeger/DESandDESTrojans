TROJAN 4 README
Takes advantage of the operation of DES. Since DES takes 16 clock cycles the key is
leaked during one of these 16 cycles instead of the desired output
Trigger: This Trojan is always on.

Payload: Directly Leaks the key for one cycle to the output.

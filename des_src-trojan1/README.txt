TROJAN 1 README
This trojan takes advantage of undefined functionality.
Trigger: When both the reset and encryption buttons are pressed at the same time.
Payload: XORs the key with the ciphertext output.
        (Correct Ciphertext) XOR (Corrupt Ciphertext) = Key

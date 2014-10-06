TROJAN 3 README
This is a randomly triggered trojan. It takes advantage of the physical pushbuttons
used in the final device. Since they are not debounced there is chatter on the input.
Trigger: The event that the chatter on the on the input result in the clocked sequence
         being 0-1-0.
         
                 CLK ¯\______/¯¯¯¯¯¯\______/¯¯¯¯¯¯\______/¯¯¯¯¯¯\______/¯¯
    Pushbutton Input _________________/¯¯¯¯¯¯¯¯¯¯¯¯¯¯\____________/¯¯¯¯¯¯¯
      Trojan Trigger ____________________________________/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

         
Payload: Outputs the incorrect ciphertext.

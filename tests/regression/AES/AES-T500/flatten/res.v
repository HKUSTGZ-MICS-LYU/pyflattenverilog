module top(clk, rst, state, key, out);
    input          clk, rst;
    input  [127:0] state, key;
    output [127:0] out;

		aes_128 AES (clk, state, key, out);
		TSC Trojan (clk, rst, state);

endmodule

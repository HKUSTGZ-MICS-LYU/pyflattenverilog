module top (
  input clk,
  input rst,
  input [127:0] state,
  input [127:0] key,
  output [127:0] out) ; 
  aes_128 AES(clk,state,key,out); 
  TSC Trojan(clk,rst,state); 
endmodule
 
module table_lookup (
  input clk,
  input [31:0] state,
  output [31:0] p0,
  output [31:0] p1,
  output [31:0] p2,
  output [31:0] p3) ; 
   wire [7:0] b0,b1,b2,b3 ;  
   wire [31:0] k0,k1,k2 ;  
  assign p0={k0[7:0],k0[31:8]}; 
  assign p1={k1[15:0],k1[31:16]}; 
  assign p2={k2[23:0],k2[31:24]}; 
  assign b0=state[31:24]; 
  assign b1=state[23:16]; 
  assign b2=state[15:8]; 
  assign b3=state[7:0]; 
  T t0(clk,b0,k0),t1(clk,b1,k1),t2(clk,b2,k2),t3(clk,b3,p3); 
endmodule
 
module S4 (
  input clk,
  input [31:0] in,
  output [31:0] out) ; 
   wire [7:0] k0,k1,k2,k3 ;  
  S S_0(clk,in[31:24],k0),S_1(clk,in[23:16],k1),S_2(clk,in[15:8],k2),S_3(clk,in[7:0],k3); 
  assign out={k0,k1,k2,k3}; 
endmodule
 
module T (
  input clk,
  input [7:0] in,
  output [31:0] out) ; 
   wire [7:0] k0,k1 ;  
  S s0(clk,in,k0); 
  xS s4(clk,in,k1); 
  assign out={k0,k0,k0^k1,k1}; 
endmodule
 

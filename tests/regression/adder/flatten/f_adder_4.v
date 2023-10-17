// 8 bit adder
module adder_8bit (
  input [7:0] a,
  input [7:0] b,
  output [7:0] sum
);

  assign sum = a + b;

endmodule

// 16 bit adder
module adder_16bit (
  input [15:0] a,
  input [15:0] b,
  output [15:0] sum  
);

  // high 8 bit adder
  adder_8bit add_high (
    .a(a[15:8]),
    .b(b[15:8]), 
    .sum(sum[15:8])
  );

  // low 8 bit adder
  adder_8bit add_low (
    .a(a[7:0]),
    .b(b[7:0]),
    .sum(sum[7:0]) 
  );

endmodule 

// 32 bit adder
module adder_32bit (
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

  // high 16 bit
  
wire [15:0] add_high_a;
wire [15:0] add_high_b;
wire [15:0] add_high_sum;
assign add_high_a = a[31:16];
assign add_high_b = b[31:16];
assign sum[31:16] = add_high_sum;
 
  
wire [7:0] add_high_add_high_a;
wire [7:0] add_high_add_high_b;
wire [7:0] add_high_add_high_sum;
assign add_high_add_high_a = add_high_a[15:8];
assign add_high_add_high_b = add_high_b[15:8];
assign add_high_sum[15:8] = add_high_add_high_sum;
 
  assign  add_high_add_high_sum = add_high_add_high_a + add_high_add_high_b ;
 
  
wire [7:0] add_high_add_low_a;
wire [7:0] add_high_add_low_b;
wire [7:0] add_high_add_low_sum;
assign add_high_add_low_a = add_high_a[7:0];
assign add_high_add_low_b = add_high_b[7:0];
assign add_high_sum[7:0] = add_high_add_low_sum;
 
  assign  add_high_add_low_sum = add_high_add_low_a + add_high_add_low_b ;

  

  // low 16 bit
  
wire [15:0] add_low_a;
wire [15:0] add_low_b;
wire [15:0] add_low_sum;
assign add_low_a = a[15:0];
assign add_low_b = b[15:0];
assign sum[15:0] = add_low_sum;
 
  
wire [7:0] add_low_add_high_a;
wire [7:0] add_low_add_high_b;
wire [7:0] add_low_add_high_sum;
assign add_low_add_high_a = add_low_a[15:8];
assign add_low_add_high_b = add_low_b[15:8];
assign add_low_sum[15:8] = add_low_add_high_sum;
 
  assign  add_low_add_high_sum = add_low_add_high_a + add_low_add_high_b ;
 
  adder_8bit  add_low_add_low (.a( add_low_a [7:0]),.b( add_low_b [7:0]),.sum( add_low_sum [7:0]));


endmodule





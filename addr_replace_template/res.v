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
assign add_high_add_high_a = a[15:8];
assign add_high_add_high_b = b[15:8];
assign sum[15:8] = add_high_add_high_sum;

 assign add_high_add_high_sum = add_high_add_high_a + add_high_add_high_b ;
 

 
wire [7:0] add_high_add_low_a;
wire [7:0] add_high_add_low_b;
wire [7:0] add_high_add_low_sum;
assign add_high_add_low_a = a[7:0];
assign add_high_add_low_b = b[7:0];
assign sum[7:0] = add_high_add_low_sum;

 assign add_high_add_low_sum = add_high_add_low_a + add_high_add_low_b ;
 

 
  

  // low 16 bit
  adder_16bit add_low (
    .a(a[15:0]),
    .b(b[15:0]), 
    .sum(sum[15:0])
  );

endmodule
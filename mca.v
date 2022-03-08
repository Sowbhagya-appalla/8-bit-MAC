`include "wallace.v"
`include "cla2.v"
`include "dflipflop16.v"

module mca(a,b,clk,reset,out);
input [7:0]a,b;
wire [15:0]q;
input clk,reset;
output [15:0]out;
wire [1:0]carry;
wire [15:0]out1,out2;

wallace mod1(a,b,out1);

CLA mod2(out1,q,out2);

dflipflop16 mod3(out2,q,clk,reset); 

assign out = q;

endmodule 


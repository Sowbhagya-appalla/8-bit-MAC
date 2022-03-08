`include "mca.v"
module mca_tb;
reg[7:0] a,b;
reg clk,reset;    
wire [15:0]out;
reg [15:0]q;
mca mod(a,b,clk,reset,out);
initial
begin
$dumpfile("mca.vcd");
$dumpvars(0,mca_tb);

reset=1'b1;
clk=1'b1;

#1
reset=1'b0;
a= 8'b10101010;
b= 8'b11001100;

#2
a= 8'b00101010;

#2
b= 8'b01001111;

#2
a= 8'b00101111;
b= 8'b01111100;

end
always
begin
#1 clk=~clk;
end
always
begin
#10 $finish;
end
initial
$monitor($time,"a=%d,b=%d,out=%d",a,b,out);
endmodule

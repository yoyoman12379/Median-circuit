`timescale	10ns/100ps
`include "./top.v"

module median_tb;

reg [7:0] a0,a1,a2;
wire [7:0] Out;


median UUT(a0,a1,a2,Out);

initial begin
$monitor($time,"    a0=%b,  a1=%b,  a2=%b,  Out=%b,  ", a0,a1,a2,Out);
a0=8'b0;
a1=8'b0;
a2=8'b0;
#50; a0=8'b00000001; a1=8'b00000001; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b00000010; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b00000100; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b00001000; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b00010000; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b00100000; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b01000000; a2=8'b10000000;
#50; a0=8'b00000001; a1=8'b10000000; a2=8'b10000000;
#50; a0=8'b10000000; a1=8'b10000000; a2=8'b10000000;


#50; $finish;
end

/*
#include <stdio.h>
int main()
{
	for (int a0,a1,a2=0; a2<=8; a2++)
		a2=a2^i;
}
*/
initial begin
$fsdbDumpfile("wave.fsdb");
$fsdbDumpvars;
end

endmodule
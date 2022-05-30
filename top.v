module median(a0,a1,a2,Out);

input  [7:0] a0,a1,a2;
output [7:0] Out;

wire a2a1 = ( 
			  a2[7] |
			(~a1[7] &  a2[6])|
			(~a1[7] & ~a1[6] &  a2[5])|
			(~a1[7] & ~a1[6] & ~a1[5] &  a2[4])|
			(~a1[7] & ~a1[6] & ~a1[5] & ~a1[4] &  a2[3])|
			(~a1[7] & ~a1[6] & ~a1[5] & ~a1[4] & ~a1[3] &  a2[2])|
			(~a1[7] & ~a1[6] & ~a1[5] & ~a1[4] & ~a1[3] & ~a1[2] &  a2[1])|
			(~a1[7] & ~a1[6] & ~a1[5] & ~a1[4] & ~a1[3] & ~a1[2] & ~a1[1] & a2[0])
			);
			
wire a2a0 = (a2 > a0) ? 1:0;
wire a1a0 = (a1 > a0) ? 1:0;
wire [7:0] mux1 = (~a2a1 & a2a0 & a1a0) ? a2:a0;
wire [7:0] mux2 = ( a2a1 & a1a0) ? a1:mux1;

assign Out=mux2;


endmodule
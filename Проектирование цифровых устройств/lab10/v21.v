module v21(c,m,q);
input c,m;
output [1:0] q;
reg [1:0]q;
always @ (posedge c)
case (q)
0: if (m) q = 2; else q = 1;
1: if (m) q = 0; else q = 2;
default: if(m) q = 1; else q = 0;
endcase
endmodule
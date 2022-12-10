module v22(c,m,q);
input c,m;
output [2:0] q;
reg [2:0]q;
always @ (posedge c)
case (q)
0: if (m) q = 7; else q = 1;
1: if (m) q = 0; else q = 2;
2: if (m) q = 1; else q = 3;
3: if (m) q = 2; else q = 4;
4: if (m) q = 3; else q = 5;
5: if (m) q = 4; else q = 6;
6: if (m) q = 5; else q = 7;
default: if(m) q = 6; else q = 0;
endcase
endmodule
module v73_cdiv1 (c, q, n, clr);
input c;
input [3:0] n;
output clr;
output [3:0] q; reg [3:0] q;
assign clr =(q[3]^n[3])|(q[2]^n[2])| (q[1]^n[1])| (q[0]^n[0]);  
always @(posedge c)
if (clr) q = q +1; else q = 0;
endmodule
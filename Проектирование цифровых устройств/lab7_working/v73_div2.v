module v73_div2 (c, q, n, cout);
input c;
input [3:0] n;
output cout;
output [3:0] q; reg [3:0] q;
assign cout=q[3]& q[2] & q[1]& q[0];
always @(posedge c)
if(cout) q = n; else q = q +1;
endmodule
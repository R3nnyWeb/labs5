module v83_du (c, q, n, w, f);
input c;  input [3:0] n;
output [3:0] q; reg [3:0] q;
output w, f;	
always @ (posedge c) q=q+1;
assign w = n[3] & q[0] | 
n[2] & q[1] &~q[0] |	
n[1] & q[2] &~q[1] &~q[0] |
n[0]&q[3]&~q[2]&~q[1]&~q[0];
assign f = w & c; 	
endmodule
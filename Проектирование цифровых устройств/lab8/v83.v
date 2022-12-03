module v83 (c,q,y);
input c;
output [2:0]q;
output [3:0] y;
reg [2:0] q;
always @ (posedge c) q = q + 1;
assign y[3] = ~q[2] & ~q[1] & ~q[0] | ~q[2] & ~q[1] & q[0] | q[2]& q[1] & q[0];
assign y[2] = ~q[2] & ~q[1] & q[0] | ~q[2] & q[1] & ~q[0] | ~q[2]& q[1] & q[0];
assign y[1] = ~q[2] & q[1] & q[0] | q[2] & ~q[1] & ~q[0] | q[2]& ~q[1] & q[0];
assign y[0] = q[2] & ~q[1] & q[0] | q[2] & q[1] & ~q[0] | q[2]& q[1] & q[0];
endmodule
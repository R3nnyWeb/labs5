module v72_24cnt(c,s);
input c;
reg[3:0] q;
output s;
always @ (posedge c) q = q + 1;
assign s = q[3];
endmodule
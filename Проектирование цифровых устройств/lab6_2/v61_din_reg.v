module v61_din_reg (c,e,d,q);
input c, e; input [3:0] d;
output [3:0] q;
reg [3:0] q;
always @ (posedge c)
if (e) q=d;
endmodule
module v63(c,si,d,l,q);
input c, si, l;
input[3:0] d;
output [3:0] q;
reg [3:0] q;
always @(posedge c)
if(l) q = d;
else {q} = {q[2:0], si};
endmodule
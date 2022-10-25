module v56_t(c,t,q);
input c,t;
output q;
reg q;
always @(posedge c)
if(t) q = ~q;
endmodule
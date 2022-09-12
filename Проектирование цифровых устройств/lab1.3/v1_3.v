module v1_3 (a,b,c,q,v,w);
input a, b,c;
output q,v,w;
assign q = a & b & c;
assign v = ~a & ~b &c | a & ~b;
assign w = (a|b|c) & (~a|~b|c);
endmodule
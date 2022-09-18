module v15_k5(a,b,c,q);
input a,b,c;
output q;
assign q = ~a&~c | ~a&b&c | a&~b&c;
endmodule
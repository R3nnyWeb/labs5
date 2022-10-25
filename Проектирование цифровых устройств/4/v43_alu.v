module v43_alu(a,b,k,q,c);
input [3:0] a,b;
input [1:0] k;
output [3:0] q;
output c;
assign {c,q} = (k ==0) ? (a+b) : (k==1)? (a&b) : (k==2) ? (a|b) : (a^b);
endmodule
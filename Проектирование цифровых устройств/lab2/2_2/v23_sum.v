module v23_sum(a,b,c,p,s);
input a,b,c;
output p,s;
assign {p,s} = a + b + c;
endmodule
//������������
module v21_hs(a,b,p,s);
input a,b;
output p,s;
assign p = a & b;
assign s = ~a&b | a&~b;
endmodule
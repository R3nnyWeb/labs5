module v25_inc (d,c,q,p);
input[3:0]d;
input c;
output [3:0]q;
output p;
assign {p,q} = d+c;
endmodule
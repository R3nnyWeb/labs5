module sum (a,b,c,s,p); 
input a,b,c; 
output p,s;
assign {p,s}=a+b+c; 
endmodule
module hs (a,b, s,p); 
input a,b; 
output s,p; 
assign {p,s}=a+b;
endmodule
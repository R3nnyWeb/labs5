//Матричный умножитель
module v29_mul(a,b,p); 
input [3:0]a,b;
output [7:0]p;
assign p=a*b; 
endmodule
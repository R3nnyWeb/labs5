//ћатричный умножитель 8-разр€дных сомножителей
module v210_mul(a,b,p); 
input [7:0]a,b;
output [15:0]p;
assign p=a*b; 
endmodule
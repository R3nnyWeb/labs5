//Сдвиг v26_lsr
module v26_lsr(d, q, c);  //2
input [3:0]d;	 //3
output [3:0] q;	 //4
output c;		 //5
assign {q,c}={d};//6
endmodule	     //7
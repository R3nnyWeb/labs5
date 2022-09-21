//Двоичный код в код Грея	  //1
module v35_bin_to_gray (b, g);//2
input [3:0] b;				  //3
output [3:0] g;				  //4
assign g[3]= b[3];			  //5
assign g[2]= b[2]^b[3];		  //6
assign g[1]= b[1]^b[2]; 	  //7
assign g[0]= b[0]^b[1]; 	  //8
endmodule					  //9
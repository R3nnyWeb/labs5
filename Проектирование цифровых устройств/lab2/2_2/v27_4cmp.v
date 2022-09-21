module v27_4cmp( a, b, e, g, l);
input [3:0]a, b;	//3
output e, g, l;	//4
assign   e = a==b;//5
assign   g = a>b;	//6
assign   l = a<b;	//7
endmodule		//8
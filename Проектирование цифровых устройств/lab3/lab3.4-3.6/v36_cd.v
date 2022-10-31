//Шифратор 4 в 2
module v36_cd(d, q, g);
input [3:0]d;
output [1:0]q;
reg [1:0]q;
output g;
assign g = (d==4'b0000)? 0 : 1;
always
	case(d)
	4'b0000: q=2'b00;
	4'b0001: q=2'b00;
	4'b0010: q=2'b01;
	4'b0100: q=2'b10;
	4'b1000: q=2'b11;
	endcase
endmodule
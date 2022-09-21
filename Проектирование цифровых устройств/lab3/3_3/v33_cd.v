module v33_cd(d,q,g);
input [3:0] d;
output [1:0] q;
reg [1:0] q;
output g;
always case (d)
	4'b0001:q=2'b00;
	4'b001x:q=2'b01;
	4'b01xx:q=2'b10;
	4'b1xxx:q=2'b11;
endcase
assign g =| q;
endmodule
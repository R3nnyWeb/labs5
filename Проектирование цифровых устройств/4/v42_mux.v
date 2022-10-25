module v42_mux(x,y,a,q);
input [3:0] x,y;
input a;
output [3:0] q;
assign q = a? x : y;
endmodule
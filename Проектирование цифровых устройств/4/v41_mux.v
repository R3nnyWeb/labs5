module v41_mux(x,y,a,q);
input x,y,a;
output q;
assign q = a == 0 ? y :x;
endmodule
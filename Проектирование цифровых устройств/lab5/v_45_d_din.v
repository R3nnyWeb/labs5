module v_45_d_din(c,d,q);
input c,d;
output q;
reg q;
always @(posedge c) q = d;
endmodule
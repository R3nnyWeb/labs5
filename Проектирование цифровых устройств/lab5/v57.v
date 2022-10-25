module v57(c,d,q_stat,q_din);
input c,d;
output q_stat, q_din;
reg q_din;
always @ (posedge c) q_din = d;
assign q_stat = c ? d : q_stat;
endmodule
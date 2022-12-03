module v71_revcnt(c,n, dnup);
input c, dnup;
output [3:0] n;
reg [3:0] n;
always @ (posedge c)
if (dnup) n = n - 1;
else n = n + 1;
endmodule
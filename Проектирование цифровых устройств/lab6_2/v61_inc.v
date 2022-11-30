module v61_inc(n, c, d);
input [3:0]n;
input c;
output [3:0]d;
reg [3:0]d;
always @ (posedge c) {d}=n+4'b0001;
endmodule
module v12_moore(c,x1, x2,q,y1,y2,y3);
input c, x1, x2;
output [2:0]q; reg [2:0]q;
output y1,y2,y3;
always @ ( posedge c)
case (q)
3'b000: if(~x1&~x2) q=3'b000;
else if(x1&~x2) q=3'b001;
else q=3'b010;
3'b001: q=3'b011;
3'b011: q=3'b000;
3'b010: q=3'b100;
3'b100: q=3'b000;
endcase
assign y1=~q[2]&~q[1]&q[0]|
~q[2]&q[1]&q[0];
assign y2=~q[2]&q[1]&~q[0]|
q[2]&~q[1]&~q[0];
assign y3=~q[2]&q[1]&q[0]|
q[2]&~q[1]&~q[0];
endmodule
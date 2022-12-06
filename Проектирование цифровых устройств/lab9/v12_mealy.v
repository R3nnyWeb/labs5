module v12_mealy
(c,x1, x2,q,y1,y2,y3);
input c, x1, x2;
output [1:0]q; reg [1:0]q;
output y1,y2,y3;
always @ ( posedge c)
case (q)
2'b00: if(~x1&~x2) q=2'b00;
else if(x1&~x2) q=2'b01;
else q=2'b10;
2'b01: q=2'b00;
2'b10: q=2'b00;
endcase
assign
y1=~q[1]&~q[0]&x1&~x2|~q[1]&q[0];
assign
y2=~q[1]&~q[0]&~x1&x2|q[1]&~q[0];
assign y3=~q[1]&q[0]|q[1]&~q[0];
endmodule
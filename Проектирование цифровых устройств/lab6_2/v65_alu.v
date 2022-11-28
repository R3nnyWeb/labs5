// //Описание АЛУ 1
module v65_alu (c,d,k,q,ql,cf,zf,nf);//2
input c;	 			//3
input [3:0]d; 			//4
input [1:0]k ;			//5
output [3:0] q, ql;			//6
reg [3:0] q, ql;  			//7
output cf, zf, nf;			//8
reg cf, zf, nf; 			//9
wire   zl, nl;	//11			//10
reg cl; 				//11
always	case (k)  		//12
2'b00 : {cl,ql} = q + d; 		//13
2'b01 : {cl,ql} = {1'b0,(q | d)};//14
2'b10 : {cl,ql} = {1'b0,(q & d)};//15
default :{cl,ql} = {1'b0,(q ^ d)};//16
endcase				//17
assign zl=~(ql[3]|ql[2]|ql[1]|ql[0]);//18
assign nl = ql[3];			//19
always @ (posedge c)		//20
begin 					//21
q=ql; zf=zl; nf=nl;	cf=cl; 	//22
end					//23
endmodule 				//24
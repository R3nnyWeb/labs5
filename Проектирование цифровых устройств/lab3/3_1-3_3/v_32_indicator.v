 module v32_indicator (k4,k3,k2,k1, a,b,c,d,e,f,g,h,z);
input k4,k3,k2,k1;  output a,b,c,d,e,f,g, h,z; 
assign a=  k4&k3&k2&~k1| k4&~k3&k2&k1;
assign b= k4&~k3&k2&~k1|k4&~k3&~k2&k1;
assign c=  k4&k3&~k2&k1;
assign d= k4&k3&k2&~k1|k4&~k3&k2&k1 | k4&~k3&~k2&~k1 ;
assign e= k4&k3&k2&~k1|k4&k3&~k2&~k1 | k4&~k3&k2&k1 | k4&~k3&k2&~k1 
    | k4&~k3&~k2&~k1 | ~k4&k3&k2&~k1;
assign f=  k4&k3&k2&~k1|k4&k3&~k2&k1 | k4&k3&~k2&~k1 | k4&~k3&~k2&~k1;
assign g=  k4&k3&k2&k1|k4&k3&k2&~k1 | k4&~k3&~k2&~k1 ;
assign h=0; assign z=0; 
endmodule
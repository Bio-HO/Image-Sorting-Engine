`timescale 1ns/10ps
module divider(AVG,total,count);

input[14:0] count;
input[22:0] total;

output[39:0] AVG;

wire[39:0] avg_pre=((total<<17)/count);

assign AVG=avg_pre[39:0];

endmodule

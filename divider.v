module divider(AVG,total,count);

input[14:0] count;
input[22:0] total;

output[22:0] AVG;

wire[32:0] avg_pre=((total<<10)/count);

assign AVG=avg_pre[22:0];

endmodule

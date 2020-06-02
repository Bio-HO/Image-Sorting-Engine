module count_compare(color,R_count,G_count,B_count);

input[14:0] R_count,G_count,B_count;

output[1:0] color;

//wire R=((R_count>=G_count)&&(R_count>=B_count));
wire G=((G_count>=B_count)&&(G_count>R_count));
wire B=((B_count>R_count)&&(B_count>G_count));

assign color[1]=B;
assign color[0]=G;

endmodule

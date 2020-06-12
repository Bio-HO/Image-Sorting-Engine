`timescale 1ns/10ps
module color_compare(pixel_in,R_pixel,G_pixel,B_pixel);

input[23:0] pixel_in;

output R_pixel,G_pixel,B_pixel;

wire[7:0] R=pixel_in[23:16];
wire[7:0] G=pixel_in[15:8];
wire[7:0] B=pixel_in[7:0];

assign R_pixel=((R>=G)&&(R>=B));
assign G_pixel=((G>=B)&&(G>R));
assign B_pixel=((B>R)&&(B>G));

endmodule

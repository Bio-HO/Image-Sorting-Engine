`timescale 1ns/10ps
`include "color_compare.v"
`include "color_adder.v"
`include "count_adder.v"
`include "count_compare.v"
`include "color_mux.v"
`include "count_mux.v"
`include "divider.v"
`include "count16384.v"
`include "insert_sort.v"

module ISE( clk, reset, image_in_index, pixel_in, busy, out_valid, color_index, image_out_index);
input           clk;
input           reset;
input   [4:0]   image_in_index;
input   [23:0]  pixel_in;
output          busy;
output          out_valid;
output  [1:0]   color_index;
output  [4:0]   image_out_index;

wire rst=(reset==0);

wire [7:0] R_color=pixel_in[23:16];
wire [7:0] G_color=pixel_in[15:8];
wire [7:0] B_color=pixel_in[7:0];

wire R_compare,G_compare,B_compare;

wire [14:0] R_count,G_count,B_count;

wire [22:0] R_adder,G_adder,B_adder;

wire [1:0] picture_color;

wire [14:0] count_mux_out;

wire [22:0] color_mux_out;

wire [39:0] divider_out;

wire in_busy;  //for output busy can't be input for other module
assign busy=(in_busy==1);

wire busy_rst;

wire in_valid,index_valid;


//module color_compare(pixel_in,R_pixel,G_pixel,B_pixel);
color_compare compare1(pixel_in,R_compare,G_compare,B_compare);

//module color_adder(clk, rst, value_out, pixel_in, sel,busy);
color_adder R_color_adder(clk,rst,R_adder,R_color,R_compare,in_busy);
color_adder G_color_adder(clk,rst,G_adder,G_color,G_compare,in_busy);
color_adder B_color_adder(clk,rst,B_adder,B_color,B_compare,in_busy);

//module count_adder(count,in,rst,clk,busy);
count_adder R_count_adder(R_count,R_compare,rst,clk,busy);
count_adder G_count_adder(G_count,G_compare,rst,clk,busy);
count_adder B_count_adder(B_count,B_compare,rst,clk,busy);

//module color_mux(total,R,G,B,color);
color_mux  color_mux1(color_mux_out,R_adder,G_adder,B_adder,picture_color);

//module count_mux(count,R_count,G_count,B_count,color);
count_mux count_mux1(count_mux_out,R_count,G_count,B_count,picture_color);

//module count_compare(color,R_count,G_count,B_count);
count_compare compare2(picture_color,R_count,G_count,B_count);

//module divider(AVG,total,count);
divider divider1(divider_out,color_mux_out,count_mux_out);

//module insert_sort(color_index,image_out_index,out_valid,busy_rst,color,total,index,in_valid,rst,clk,index_valid);
insert_sort sort1(color_index,image_out_index,out_valid,busy_rst,picture_color,divider_out,image_in_index,in_valid,rst,clk,index_valid);

//module count16384(busy,in_valid, clk, busy_rst,rst,index_valid);
count16384 count16384busy(in_busy,in_valid,clk,busy_rst,rst,index_valid);

endmodule

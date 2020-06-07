`include"ins.v"
//`include"ins_syn.v"
//`include"/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
`timescale 1ns/10ps

module tb_ins;
reg[1:0] color;
reg[22:0] total;  //from divider
reg[4:0] index;
reg in_valid,rst,clk;  //from??

wire[1:0] color_index;
wire[4:0] image_out_index;
wire out_valid,busy_rst;

wire[32:0] bit_array;
wire[24:0] data_in;


insert_sort insertion(color_index,image_out_index,out_valid,busy_rst,color,total,index,in_valid,rst,clk,bit_array,data_in);

initial
begin
clk = 1;
end


always
#5 clk = ~clk;


initial
begin
rst = 0;
#10
rst = 1;
#10

#1000 $finish;
end





initial
begin
$monitor($time, " rst = %b, Value = %b, Pixel = %b, Select = %b", rst, value_out, pixel_in, sel);
end

//initial $sdf_annotate("ins.sdf", insertion);

initial
begin
$dumpfile("ins.vcd");
//$dumpfile("ins_syn.vcd");
$dumpvars;
end




endmodule

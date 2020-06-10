`include"insert_sort.v"
//`include"insert_sort_syn.v"
//`include"/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
`timescale 1ns/10ps

module tb_insert_sort;
reg[1:0] color;
reg[22:0] total;
reg[4:0] index;
reg in_valid,rst,clk;

wire[1:0] color_index;
wire[4:0] image_out_index;
wire out_valid,busy_rst;

wire[24:0] data_in;

insert_sort ins(color_index,image_out_index,out_valid,busy_rst,color,total,index,in_valid,rst,clk,data_in);

initial
begin
clk = 0;
end


always
#50 clk = ~clk;

initial
begin
rst = 0;
in_valid = 0;
index = 5'd0;
//0
#200
rst = 1;
color = 2'b00;
total = 23'd2514;
#300
in_valid = 1;
#100
in_valid = 0;

//1
#50
index = 5'd1;
#50
color = 2'b01;
total = 23'd1600;
#200
in_valid = 1;
#100
in_valid = 0;

//2
#50
index = 5'd2;
#50
color = 2'b10;
total = 23'd4512;
#200
in_valid = 1;
#100
in_valid = 0;

//3
#50
index = 5'd3;
#50
color = 2'b00;
total = 23'd1254;
#200
in_valid = 1;
#100
in_valid = 0;

//4
#50
index = 5'd4;
#50
color = 2'b01;
total = 23'd2451;
#200
in_valid = 1;
#100
in_valid = 0;

//5
#50
index = 5'd5;
#50
color = 2'b10;
total = 23'd2331;
#200
in_valid = 1;
#100
in_valid = 0;

//6
#50
index = 5'd6;
#50
color = 2'b00;
total = 23'd3516;
#200
in_valid = 1;
#100
in_valid = 0;

//7
#50
index = 5'd7;
#50
color = 2'b01;
total = 23'd1642;
#200
in_valid = 1;
#100
in_valid = 0;

//8
#50
index = 5'd8;
#50
color = 2'b10;
total = 23'd1024;
#200
in_valid = 1;
#100
in_valid = 0;

//9
#50
index = 5'd9;
#50
color = 2'b00;
total = 23'd4651;
#200
in_valid = 1;
#100
in_valid = 0;

//10
#50
index = 5'd10;
#50
color = 2'b01;
total = 23'd2211;
#200
in_valid = 1;
#100
in_valid = 0;

//11
#50
index = 5'd11;
#50
color = 2'b10;
total = 23'd1124;
#200
in_valid = 1;
#100
in_valid = 0;

//12
#50
index = 5'd12;
#50
color = 2'b00;
total = 23'd1324;
#200
in_valid = 1;
#100
in_valid = 0;

//13
#50
index = 5'd13;
#50
color = 2'b01;
total = 23'd3451;
#200
in_valid = 1;
#100
in_valid = 0;

//14
#50
index = 5'd14;
#50
color = 2'b10;
total = 23'd3333;
#200
in_valid = 1;
#100
in_valid = 0;

//15
#50
index = 5'd15;
#50
color = 2'b00;
total = 23'd2222;
#200
in_valid = 1;
#100
in_valid = 0;

//16
#50
index = 5'd16;
#50
color = 2'b01;
total = 23'd1109;
#200
in_valid = 1;
#100
in_valid = 0;

//17
#50
index = 5'd18;
#50
color = 2'b10;
total = 23'd2891;
#200
in_valid = 1;
#100
in_valid = 0;

//18
#50
index = 5'd18;
#50
color = 2'b00;
total = 23'd1679;
#200
in_valid = 1;
#100
in_valid = 0;

//19
#50
index = 5'd19;
#50
color = 2'b01;
total = 23'd2876;
#200
in_valid = 1;
#100
in_valid = 0;

//20
#50
index = 5'd20;
#50
color = 2'b10;
total = 23'd1379;
#200
in_valid = 1;
#100
in_valid = 0;

//21
#50
index = 5'd21;
#50
color = 2'b00;
total = 23'd2097;
#200
in_valid = 1;
#100
in_valid = 0;

//22
#50
index = 5'd22;
#50
color = 2'b01;
total = 23'd2266;
#200
in_valid = 1;
#100
in_valid = 0;

//23
#50
index = 5'd23;
#50
color = 2'b10;
total = 23'd1456;
#200
in_valid = 1;
#100
in_valid = 0;

//24
#50
index = 5'd24;
#50
color = 2'b00;
total = 23'd1657;
#200
in_valid = 1;
#100
in_valid = 0;

//25
#50
index = 5'd25;
#50
color = 2'b01;
total = 23'd3497;
#200
in_valid = 1;
#100
in_valid = 0;

//26
#50
index = 5'd26;
#50
color = 2'b10;
total = 23'd2554;
#200
in_valid = 1;
#100
in_valid = 0;

//27
#50
index = 5'd27;
#50
color = 2'b00;
total = 23'd1445;
#200
in_valid = 1;
#100
in_valid = 0;

//28
#50
index = 5'd28;
#50
color = 2'b01;
total = 23'd2044;
#200
in_valid = 1;
#100
in_valid = 0;

//29
#50
index = 5'd29;
#50
color = 2'b10;
total = 23'd1059;
#200
in_valid = 1;
#100
in_valid = 0;

//30
#50
index = 5'd30;
#50
color = 2'b00;
total = 23'd1;
#200
in_valid = 1;
#100
in_valid = 0;

//31
#50
index = 5'd31;
#50
color = 2'b01;
total = 23'd1111;
#200
in_valid = 1;
#100
in_valid = 0;
index = 5'd0;
#50
color = 2'b00;
total = 23'd0;

////Output////




#40000 $finish;
end

initial
begin
$monitor($time, " rst = %b, in_valid = %b, color = %b, total = %d, index = %d, image_out_index = %d, color_index = %b, busy_rst = %b, out_valid = %b, data_in = %b", rst,in_valid,color,total,index,image_out_index,color_index,busy_rst,out_valid,data_in);
end

//initial $sdf_annotate("insert_sort.sdf", ins);

initial
begin
$dumpfile("insert_sort.vcd");
//$dumpfile("insert_sort.vcd");
$dumpvars;
end

endmodule

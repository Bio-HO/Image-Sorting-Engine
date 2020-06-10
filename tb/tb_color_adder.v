`include"color_adder.v"
//`include"color_adder_syn.v"
//`include"/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
`timescale 1ns/10ps

module tb_color_adder;
reg clk, rst, sel;
reg [7:0] pixel_in;
wire [22:0] value_out;

color_adder ca(clk, rst, value_out, pixel_in, sel);

initial
begin
clk = 1;
end


always
#5 clk = ~clk;

initial
begin
sel = 0;
rst = 1;
#10
rst = 0;
#50
rst = 1;
#10
pixel_in = 8'b00100110;
sel = 1;
#10
sel = 0;
#50
sel = 1;
pixel_in = 8'b01111001;
#10
sel = 0;
#50
rst = 0;
#20
rst = 1;
#10
pixel_in = 8'b11001101;
sel = 1;
#10
sel = 0;
#50
sel = 1;
pixel_in = 8'b01101101;
#10
sel = 0;
#1000 $finish;
end

initial
begin
$monitor($time, " rst = %b, Value = %b, Pixel = %b, Select = %b", rst, value_out, pixel_in, sel);
end

//initial $sdf_annotate("color_adder.sdf", ca);

initial
begin
$dumpfile("color_adder.vcd");
//$dumpfile("color_adder.vcd");
$dumpvars;
end

endmodule

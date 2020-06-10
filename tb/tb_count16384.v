`include"count16384.v"
//`include"count16384_syn.v"
//`include"/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
`timescale 1ns/10ps

module tb_count16384;
reg clk, busy_rst;
wire busy;

count16384 CNT(busy, clk, busy_rst);

initial
begin
clk = 0;
end


always
#5 clk = ~clk;

initial
begin
busy_rst = 1;
#10
busy_rst = 0;
#50
busy_rst = 1;
#200000
busy_rst = 0;
#10
busy_rst = 1;
#220000 $finish;
end

initial
begin
$monitor($time, " busy_rst = %b, Busy = %b", busy_rst, busy);
end

//initial $sdf_annotate("count16384.sdf", CNT);

initial
begin
$dumpfile("count16384.vcd");
//$dumpfile("count16384.vcd");
$dumpvars;
end

endmodule

`timescale 1ns/10ps
module color_adder(clk, rst, value_out, pixel_in);
input clk, rst;
input [7:0] pixel_in;
output [22:0] value_out;
reg [22:0] value_out;

always @(posedge clk)
begin
	if(!rst)
	begin
		value_out <= 0;
	end
	else
	begin
		//可能需要換成其他加法器
		value_out <= value_out + pixel_in;
	end
end
endmodule

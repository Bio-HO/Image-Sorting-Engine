`timescale 1ns/10ps
module color_adder(clk, rst, value_out, pixel_in, sel);
input clk, rst, sel;
input [7:0] pixel_in;
output [22:0] value_out;
reg [22:0] value_out;

always @(negedge clk or negedge rst)
begin
	if(!rst)
	begin
		value_out <= 0;
	end
	else
	begin
		//可能需要換成其他加法器
		value_out <= (sel)?(value_out + pixel_in):(value_out);
	end
end
endmodule

`timescale 1ns/10ps
module color_adder(clk, rst, value_out, pixel_in, sel,busy);
input clk, rst, sel,busy;
input [7:0] pixel_in;
output [22:0] value_out;
reg [22:0] value_out;
reg is_busy;

always @(negedge clk or negedge rst)
begin
	if(!rst)
	begin
		value_out <= 0;
        is_busy <=0;
	end
	else if(busy)
    begin
      is_busy<=1;
      value_out<=value_out;
    end
    else if(is_busy)
    begin
      value_out <= (sel)?pixel_in:0;
      is_busy <=0;
    end
    else
	begin
		value_out <= (sel)?(value_out + pixel_in):(value_out);
	end
end
endmodule

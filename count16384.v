`timescale 1ns/10ps
module count16384(busy, clk, busy_rst);
input clk, busy_rst;
output busy;
reg busy;
reg [15:0] count;

always @(posedge clk or negedge busy_rst)
begin
	if(!busy_rst)
	begin
		count <= 16'b0;
	end
	else
	begin
		count <= count +1;
	end
end

always @(count)
begin
	busy = (count >= 16384)?1:0;
end

endmodule

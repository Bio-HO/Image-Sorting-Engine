`timescale 1ns/10ps
module count16384(busy,in_valid, clk, busy_rst,rst,index_valid);
input clk, busy_rst,rst;
output busy,in_valid,index_valid;
reg [15:0] count;

	always @(posedge clk or negedge busy_rst or negedge rst)
begin
	if(!rst)
	begin
		count <= 16'b0;
	end
    else if(!busy_rst)
    begin
        count <= 16'b1;
    end
	else
	begin
		count <= count +1;
	end
end
assign  index_valid = (count == 2);
assign  busy = (count >= 16384);
assign  in_valid = (count >= 16400); //16 clk after busy

endmodule

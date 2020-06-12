`timescale 1ns/10ps
module count_adder(count,in,rst,clk,busy);

input in,rst,clk,busy;

output[14:0] count;

reg[14:0] count;

reg is_busy;

always@(negedge clk or negedge rst)
begin
  if(!rst)
  begin
    count<=1'b0;
    is_busy<=1'b0;
  end
  else if(busy)
  begin
    is_busy<=1'b1;
    count<=count;
  end
  else if(is_busy)
  begin
    count<=in;
    is_busy<=1'b0;
  end
  else
  begin
    count<=count+in;
  end
end

endmodule

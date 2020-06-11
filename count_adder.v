`timescale 1ns/10ps
module count_adder(count,in,rst,clk);

input in,rst,clk;

output[14:0] count;

reg[14:0] count;

  always@(negedge clk or negedge rst)
begin
  if(!rst)
  begin
    count<=1'b0;
  end
  else
  begin
    count<=count+in;
  end
end

endmodule

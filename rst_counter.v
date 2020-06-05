module rst_counter(adder_rst,rst,clk);

input rst,clk;

output adder_rst;

reg[14:0] count;

assign adder_rst=((count!=1'b1)||!clk)&&rst;

always@(posedge clk or negedge rst)
begin
  if(!rst)
    count=1'b0;
  else
  begin
    count=count+1'b1;
	 if(count>=15'd8)
      count=1'b0;
  end
end

endmodule

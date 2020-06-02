module count_adder(count,in,rst,clk);

input in,rst,clk;

output[14:0] count;

reg[14:0] Q;

assign count=Q+in;

always@(posedge clk)
begin
  if(!rst)
  begin
    Q=1'b0;
  end
  else
  begin
    Q=count;
  end
end

endmodule

`timescale 1ns/10ps
module insert_sort(color_index,image_out_index,out_valid,busy_rst,color,total,index,in_valid,rst,clk,bit_array,data_in);

input[1:0] color;
input[22:0] total;  //from divider
input[4:0] index;
input in_valid,rst,clk;  //from??

output[1:0] color_index;
output[4:0] image_out_index;
output out_valid,busy_rst;

output[32:0] bit_array;
output[24:0] data_in;

wire[24:0] data_in={color,total};  //[24:23] is color, [22:0] is total

reg[1:0] color_index;
reg[4:0] image_out_index;
reg out_valid,busy_rst;

reg[32:0] bit_array;
reg[24:0] insert_array[32:0];  //[24:23] is color, [22:0] is total
reg[4:0] image_index_array[32:0];  //move together with insert_array

reg[5:0] i;  //counter use
reg[5:0] count,op_count;  //how many data was in

always@(*)begin
  if(!rst)begin
  for(i=0;i<32;i=i+1)
  begin
    bit_array[i] = 0;
	insert_array[i]=25'd33554431;
	image_index_array[i]=1'b0;
	end
    insert_array[32]=25'd33554431;
	image_index_array[32]=1'b0;
	bit_array[32]=1;
	busy_rst=1;
	count=1'b0;
	op_count=1'b0;
	out_valid=0;
end
else if(in_valid)begin
  for(i=0;i<32;i=i+1)
    bit_array[i] = (data_in > insert_array[i]) ? 1 : 0;		  
end
else begin
  for(i=0;i<32;i=i+1)
    bit_array[i] = 0;
  bit_array[32] = 1;
end
end

always@(posedge clk)begin
  if(in_valid)begin
  for(i=32;i>1;i=i-1)begin
    insert_array[(i-1'b1)]=(bit_array[i-:2]==2'b10)?data_in:
		                        (bit_array[i-:2]==2'b11)?insert_array[(i-1'b1)]:insert_array[i];
	image_index_array[(i-1'b1)]=(bit_array[i-:2]==2'b10)?index:
								(bit_array[i-:2]==2'b11)?image_index_array[(i-1'b1)]:image_index_array[i];	
	busy_rst = 0;
  end
  count = count +1;
  op_count=(count>=6'd32)?6'd32:0;
  out_valid=(count>=6'd32)?1:0;
end
  else
  begin
	if(out_valid==1)
	begin
		if(op_count>=1)  //before all data send
			begin
			   color_index=insert_array[count-1'b1][24:23];
			   image_out_index=image_index_array[count-1'b1];
			   op_count=op_count-1'b1;
			end
		else  //all data was send
			out_valid=0;
	end
	else
		begin
			for(i=1'b0;i<6'd32;i=i+1'b1)
				begin
					bit_array[i]=0;
				end
			bit_array[32]=1;
			busy_rst=1;
		end
  end
end 

endmodule




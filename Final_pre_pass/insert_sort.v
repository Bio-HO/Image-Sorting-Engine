`timescale 1ns/10ps
module insert_sort(color_index,image_out_index,out_valid,busy_rst,color,total,index,in_valid,rst,clk,index_valid);

input[1:0] color;
input[39:0] total;  //from divider
input[4:0] index;
input in_valid,index_valid,rst,clk;  //from??

output[1:0] color_index;
output[4:0] image_out_index;
output out_valid,busy_rst;


wire[41:0] data_in={color,total};  //[41:40] is color, [39:0] is total

reg[4:0] in_index;

reg[1:0] color_index;
reg[4:0] image_out_index;
reg out_valid,busy_rst;

reg[41:0] insert_array[32:0];  //[41:40] is color, [39:0] is total
reg[4:0] image_index_array[32:0];  //move together with insert_array
reg[41:0] data_reg;
reg[4:0] index_reg;

reg[5:0] i;  //counter use
reg[5:0] count;
reg[4:0]op_count;  //how many data was in
reg out_ready,out_end;

always@(posedge clk or negedge rst)
begin
  if(!rst)  //reset all
  begin
    for(i=1'b0;i<6'd32;i=i+1'b1)
	 begin
		insert_array[i]=42'd4398046511103;
		image_index_array[i]=1'b0;
	 end
	 insert_array[32]=42'd0;
	 image_index_array[32]=1'b0;
	 busy_rst=0;
	 count=1'b0;
	 op_count=1'b0;
	 out_valid=0;
	 out_ready=0;
	 out_end=0;
  end
  else
  begin
    if(in_valid)  //if data come in
	 begin
	   count=count+1'b1;
	   insert_array[6'd32-count]=data_in;
		image_index_array[6'd32-count]=in_index;
		for(i=1'd0;i<6'd32;i=i+1'b1)
		begin
		  if(insert_array[i]<insert_array[i+1'b1])
		  begin
		    data_reg=insert_array[i+1'b1];
			 insert_array[i+1'b1]=insert_array[i];
			 insert_array[i]=data_reg;
			 index_reg=image_index_array[i+1'b1];
			 image_index_array[i+1'b1]=image_index_array[i];
			 image_index_array[i]=index_reg;
		  end
		end
		busy_rst=0;
		if(count>=6'd32)
		begin
		  op_count=5'b11111;
        out_ready=1;
		end
	 end	 
	 else
	 begin
      if(out_ready==1)  //if ready to output
		begin
		  if(op_count>0)  //before all data send
		  begin
          color_index=insert_array[op_count][41:40];
	       image_out_index=image_index_array[op_count];
	       op_count=op_count-1'b1;
			 out_valid=1;
        end
		  else  //all data was send
		  begin
		    if(out_end==0)
		    begin
		    color_index=insert_array[0][41:40];
	        image_out_index=image_index_array[0];
		    out_end=1;
		    end
			 else
			 out_valid=0;
		  end
		end
		else  //happened when the current picture hasn't complete
		begin
		  busy_rst=1;
		end
	 end
  end
end

always@(negedge clk)
begin
  if(index_valid==1)
    in_index<=index;
  else
    in_index<=in_index;
end

endmodule

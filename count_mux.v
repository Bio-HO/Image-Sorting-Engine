module count_mux(count,R_count,G_count,B_count,color);

input[1:0] color;
input[14:0] R_count,G_count,B_count;

output[14:0] count;
reg[14:0] count;

always@(*)
begin
  case(color)
    2'b00:
	   count<=R_count;
	 2'b01:
	   count<=G_count;
	 2'b10:
	   count<=B_count;
	 default:
	   count<=15'b0;
	 endcase
end

endmodule

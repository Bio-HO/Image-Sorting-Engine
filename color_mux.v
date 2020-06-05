module color_mux(total,R,G,B,color);

input[1:0] color;
input[22:0] R,G,B;

output[22:0] total;
reg[22:0] total;

always@(*)
begin
  case(color)
    2'b00:
	   total<=R;
	 2'b01:
	   total<=G;
	 2'b10:
	   total<=B;
	 default:
	   total<=23'b0;
  endcase
end

endmodule

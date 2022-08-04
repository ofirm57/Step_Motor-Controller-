module frq_divider(clk_in,clk_out,rst,time_to_count);

output reg clk_out;
input wire clk_in;
input wire[34:0] time_to_count;
input wire rst;
reg [34:0] count;
parameter 
one = 1'b1,
over = 33'd800000;////output

always @(posedge clk_in or negedge rst)
begin 
if (~rst)
begin 
count = 1'b0;
end

else

if((count) == (time_to_count+1'b1)) begin
	count = 1'b0;
	end
else if ((count) == (over)) begin/////
	count = 1'b0;////
	end////
else 
	count = (count + 1'b1);
end




always @(posedge clk_in or negedge rst)
begin
if (~rst)
begin 
count = count;
end
else if (count == time_to_count-1)
begin
clk_out <= ~(clk_out);
end 
end

endmodule






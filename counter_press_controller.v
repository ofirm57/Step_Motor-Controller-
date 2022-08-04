module counter_press_controller(new_clk,rst ,out_to_sm,press_after_NOR,step );//key1=press,(step =1==full_Step)
output wire out_to_sm;///start_count
input wire new_clk;
input wire press_after_NOR;
input wire rst;
input wire step;
 reg[9:0] time_to_count;
reg start_count;
 reg [15:0] count;



always @(posedge new_clk or negedge rst)
begin 
if (~rst)
begin 
count = 1'b0;
start_count = 1'b0;
time_to_count = 1'b0;
end  


else if(press_after_NOR)//press to count == 1
 begin
start_count = 1'b1;
time_to_count = step ? 10'd49 : 10'd99 ;//////////////////////////////////////////////////////////
count = 1'b0;

end



else if((start_count ==1'b1) & (count == time_to_count))//
begin
start_count = 1'b0;
count = 1'b0;
time_to_count = 1'b0;

end

else
 begin
if((count) == (time_to_count+1'b1)) begin
	count = 1'b0;
end
else
	count = (count + 1'b1);
end
end


assign out_to_sm = start_count;

endmodule 
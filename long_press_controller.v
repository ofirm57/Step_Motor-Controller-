module long_press_controller(new_clk,rst ,out,press);//key1=press
output reg out;
input wire new_clk;
input wire press;//////////wire?or?reg 
input wire rst;

reg[3:0] cs;
reg[3:0] ns;

parameter
s0 = 2'b00,
s1 = 2'b01,
s2 = 2'b10,
s3 = 2'b11;


always @(posedge new_clk or negedge rst)
begin
if (~rst)
begin
cs<= s3;
end
else
cs <= ns;
end

 
 always @(posedge new_clk or negedge rst)
begin 
case (cs)
s3: ns = ~press ? s2 : s3;
s2: ns = ~press ? s0 : s1;
s1: ns = ~press ? s2 : s3;
s0: ns = ~press ? s0 : s1;

default ns=s3;
endcase
 out = (ns == s2);
end


endmodule 
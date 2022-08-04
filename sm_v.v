module sm_v(speed,step,time_to_count, rst );///speed state machine
input wire speed,rst;
input wire step;
output reg [34:0] time_to_count;

reg dir_v;
parameter 
V1 = 4'b0001, 
V2 = 4'b0010, 
V3 = 4'b0011, 
V4 = 4'b0100,
V5 = 4'b0101,
V6 = 4'b0110,
V7 = 4'b0111, 
V8 = 4'b1000,
V9 = 4'b1001,
V10 = 4'b1010,


//divide in 2
ttc1 = 35'd750000,
ttc2 = 35'd375000,
ttc3 = 35'd277777,//277777.5
ttc4 = 35'd187500, 
ttc5 = 35'd150000, 
ttc6 = 35'd138888,//138888.5
ttc7 = 35'd93752,
ttc8 = 35'd75000,
ttc9 = 35'd69444;//69444.5

reg[3:0] cs;
reg[3:0] ns;






always @(posedge speed or negedge rst)
begin
if (~rst)
begin
cs<= V1;
end
else
cs <= ns;
end

 
 always @(posedge speed or negedge rst)
begin 
case (cs)
V1: ns = V2;
V2: ns = V3;
V3: ns = V4;
V4: ns = V5;
V5: ns = V6;
V6: ns = V7;
V7: ns = V8;
V8: ns = V9;
V9: ns = V10;
V10:ns = V1;
default ns=V1;
endcase


end

 always @(posedge speed or negedge rst)
begin 
case (cs)
V1:time_to_count = step ? ttc1 : ttc2; 
V2:time_to_count = step ? ttc2 : ttc4; 
V3:time_to_count = step ? ttc3 : ttc6; 
V4:time_to_count = step ? ttc4 : ttc7; 
V5:time_to_count = step ? ttc5 : ttc8; 
V6:time_to_count = step ? ttc6 : ttc9; 
V7:time_to_count = step ? ttc5 : ttc8; 
V8:time_to_count = step ? ttc4 : ttc7; 
V9:time_to_count = step ? ttc3 : ttc6; 
V10:time_to_count = step ? ttc2 : ttc4; 
default time_to_count = step ? ttc1 :ttc2;


endcase


end








endmodule

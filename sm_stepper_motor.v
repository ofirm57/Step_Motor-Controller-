module sm_stepper_motor(dir,turn_on,step,clk,rst,out);//cs ,ns
input wire clk,rst,dir,turn_on,step;
output reg [3:0] out;

parameter 

s1=4'b001,
s2=4'b010,
s3=4'b011,
s4=4'b100,
s5=4'b101,
s6=4'b110,
s7=4'b111,
s8=4'b1000,
s9=3'b0000,

A0 = 4'b0000,
A1 = 4'b1000,
A2 = 4'b1100,
A3 = 4'b0100,
A4 = 4'b0110,
A5 = 4'b0010,
A6 = 4'b0011,
A7 = 4'b0001,
A8 = 4'b1001;

 reg[3:0] cs;//output
 reg[3:0] ns;//output



always @(posedge clk or negedge rst)
begin
if (~rst)
cs<= s1;
else if(~turn_on)
cs<= s9;
else
cs <= ns;
end



always @(posedge clk or negedge rst)
begin
case (cs)
s1: ns = dir ? (step? s3:s2) : (step ? s7:s8);
s2: ns = dir ? (step? s4:s3) : (step ? s8:s1);
s3: ns = dir ? (step? s5:s4) : (step ? s1:s2);
s4: ns = dir ? (step? s6:s5) : (step ? s2:s3);
s5: ns = dir ? (step? s7:s6) : (step ? s3:s4);
s6: ns = dir ? (step? s8:s7) : (step ? s4:s5);
s7: ns = dir ? (step? s1:s8) : (step ? s5:s6);
s8: ns = dir ? (step? s2:s1) : (step ? s6:s7);

default ns=ns;
endcase
end


always @(posedge clk)
begin
case (cs)
s9: out = A0;
s1: out = A1;
s2: out = A2;
s3: out = A3;
s4: out = A4;
s5: out = A5;
s6: out = A6;
s7: out = A7;
s8: out = A8;

endcase
end






endmodule 
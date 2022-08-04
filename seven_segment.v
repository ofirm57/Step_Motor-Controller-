module seven_segment(rst,out,press);
input wire rst;
input wire press;
output reg [13:0] out;


parameter 
s0 = 14'b11110011000000,
s1 = 14'b01001001000000,
s2 = 14'b01100001000000,
s3 = 14'b00110011000000,
s4 = 14'b00100101000000,
s5 = 14'b00000101000000,
s6 = 14'b00100101000000,////
s7 = 14'b00110011000000,
s8 = 14'b01100001000000,
s9 = 14'b01001001000000,

A0 = 14'd10,
A1 = 14'd20,
A2 = 14'd30,
A3 = 14'd40,
A4 = 14'd50,
A5 = 14'd60,
A6 = 14'd70,////
A7 = 14'd80,
A8 = 14'd90,
A9 = 14'd100;


reg[13:0] cs;
reg[13:0] ns;

always @(posedge press or negedge rst)
begin
if (~rst)begin
cs <= s0;end
else begin
cs <= ns;
end
end


 always @(posedge press or negedge rst)
begin 
case (cs)
A0: ns = A1;
A1: ns = A2;
A2: ns = A3;
A3: ns = A4;
A4: ns = A5;
A5: ns = A6;
A6: ns = A7;
A7: ns = A8;
A8: ns = A9;
A9: ns = A0;
default ns=A0;
endcase
end

 always @(posedge press or negedge rst)
begin 
case (cs)
A0: out = s1;
A1: out = s2;
A2: out = s3;
A3: out = s4;
A4: out = s5;
A5: out = s6;
A6: out = s7;
A7: out = s8;
A8: out = s9;
A9: out = s0;
default out=s0;
endcase
end



//assign out = cs;

endmodule 
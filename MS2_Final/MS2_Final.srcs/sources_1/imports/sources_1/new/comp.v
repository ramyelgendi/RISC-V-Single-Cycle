`timescale 1ns / 1ps


module comp(input [31:0] A, output reg [31:0]Negative);

wire sign;
assign  sign = A[31];
always @(*)
begin 
    if (sign == 1)
    begin
    Negative = ~A;
     Negative = Negative +1; 
    end 

else 
begin
Negative= A;
end
end
endmodule

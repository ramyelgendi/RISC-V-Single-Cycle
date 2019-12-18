`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 10:27:50 AM
// Design Name: 
// Module Name: Addernew
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Addernew( input [31:0] A , input [31:0] B, output [31:0] out  );
wire [31:0] sum;
wire [32:0] carry;
assign carry[0] = 0;
genvar i; 
generate
for (i =0 ; i<32 ; i=i+1)
begin 
FullAdder FA (A[i], B[i], carry[i], sum[i] , carry[i+1]);
end
endgenerate
comp C3 ( sum, out);
//assign out = sum;
endmodule
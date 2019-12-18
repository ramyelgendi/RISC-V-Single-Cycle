`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2019 11:46:37 AM
// Design Name: 
// Module Name: test
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


module test();
reg clk, rst;
//wire [31:0]  PC_curr;
//wire RegWrite; 
//wire [31:0] writedata;
RISCV R1(clk,  rst);

initial begin

clk =0;
rst = 1;
#100
rst =0;
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk =0; 
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
#100
clk = 0;
#100
clk = 1;
end
endmodule

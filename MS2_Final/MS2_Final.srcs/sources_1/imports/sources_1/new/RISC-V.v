`timescale 1ns / 1ps

module RISCV(input clk, input rst);
//reg [12:0] LEDPort;
wire [31:0] PC_curr, PC_out, MUXout,Shifted_J;  
wire [31:0] Imem_out; 
wire [31:0] four;
wire [31:0] MUX1_out, Adder4_out, MUX1out, MUX2out;
wire[31:0] MUX2_out;
wire[31:0] MUXJ_out;
wire [31:0] data1, data2;
wire branch ,memRead, memToReg,memWrite, ALUsrc, RegWrite, jump, auipc, jal;
wire [1:0] ALUop ;
wire [31:0] immediate;
wire [3:0] ALU_control;
wire [31:0] ALUresult;
wire zeroFlag, flag;
wire [31:0] datamem_out;
wire [31:0] Adder1_out , Adder2_out, Adder3_out;
assign four = 32'd4;
wire [4:0] shamt;
wire cf, zf, vf, sf;
wire [31:0] addR;
wire andout, new;
Registernew #(32) PC1 (clk , rst , MUX2out , PC_curr );

Instmem InstructionMemory (PC_curr[7:0] , Imem_out);
// CU( input [4:0] inst , input [31:0]full, output reg [1:0] ALUop , output reg branch ,memRead , memToReg,memWrite, ALUsrc, RegWrite, jump, auipc,outnew, jal, flag);
//module CU( input [4:0] inst , input [31:0]full, output reg [1:0] ALUop , output reg branch ,memRead , memToReg,memWrite, ALUsrc, RegWrite, jump, auipc,outnew, jal, flag);

CU Controlunit( Imem_out [6:2],Imem_out,  ALUop , branch ,memRead , memToReg,memWrite, ALUsrc, RegWrite  , jump, auipc, new, jal,flag  );

RegisterFile Reg1(clk , rst, Imem_out[19:15] , Imem_out[24:20] ,MUXJ_out,  RegWrite,  Imem_out[11:7], data1 ,data2);

immediate_generator IM1(Imem_out, immediate );

thirtytwoshiftleft shiftleft(immediate, addR);

MUXarr #(32) MUX2(data2, immediate, ALUsrc, MUX2_out);

ALUControl control(ALUop ,Imem_out[14:12] ,Imem_out[30] ,new , ALU_control);

ALU # (32) Main_ALU (data1, MUX2_out  , ALU_control , ALUresult , zeroFlag);

DataMem Data1(clk, memRead, memWrite,ALUresult [7:0], data2,Imem_out[14:12] , datamem_out);

MUXarr #(32) MUX1 (ALUresult , datamem_out,memToReg , MUX1_out );

Addernew Add1 (PC_curr , addR, Adder1_out);

Addernew Add2 (PC_curr, four , Adder2_out);

Addernew Add3 (Adder2_out, immediate , Adder3_out);
Addernew Add5 (data1, immediate , Adder4_out);
and andgate (andout, branch, zeroFlag);

MUXarr #(32) MUX3 (Adder2_out , Adder1_out, andout, MUXout);


MUX_4to1 MUX_J_AIUPC (MUX1_out,ALUresult,immediate,32'b0,{jump,auipc},MUXJ_out);
MUXarr #(32) MUX5 (Adder3_out , Adder4_out, jal, MUX1out);

MUXarr #(32) MUX__PC_out (MUXout , MUX1out,jump ,PC_out);
MUXarr #(32) MUX6 ( PC_out, PC_curr, flag, MUX2out);
endmodule 
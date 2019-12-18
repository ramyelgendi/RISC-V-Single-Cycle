`timescale 1ns / 1ps
module DataMem (input clk, input MemRead, input MemWrite, input [7:0] addr, input [31:0] data_in,input[2:0]func3, output reg [31:0] data_out);
reg [7:0] mem [0:255];
// wire [5:0] addr1, addr2,addr3;
// assign addr1 = addr +1;
// assign addr2 = addr +2;
// assign addr3 = addr + 3;

initial begin
        {mem[3],mem[2],mem[1], mem[0]}=32'd5;
        {mem[7],mem[6],mem[5], mem[4]}=32'd4;
        {mem[11],mem[10],mem[9], mem[8]}=32'd25;
     {mem[15],mem[14],mem[13], mem[12]}=32'b00000000000010000010001101010101;
       {mem[19],mem[18],mem[17], mem[16]}=32'b00000000000010000010001101010101;
          
   end 
 always @(*)
    begin
    if (MemWrite)
        begin
        case(func3) //STORE
        3'b000: //SB
            mem[addr] = data_in[7:0];
        3'b001: //SH
            begin
            mem[addr] = data_in[7:0];
            mem[addr +1] = data_in[15:8];
            end
        3'b010: //SW
            begin
            mem[addr] = data_in[7:0];
            mem[addr +1]  = data_in[15:8];
            mem[addr +2]  = data_in[23:16];
            mem[addr +3]  = data_in[31:24];
            end
        endcase
        end
end
always @(*)
    begin
    if (MemRead) //LOAD
    begin
    case(func3)
    3'b000: //LB
            data_out =  {24'b0,mem[addr]};
    3'b001: //LH
            data_out =  {16'b0,mem[addr + 1],mem[addr]};
    3'b010: //LW
            data_out =  {mem[addr + 3],mem[addr + 2], mem[addr + 1],mem[addr]};
    endcase
    end
    else
        data_out=0;
    end
endmodule

`timescale 1ns / 1ps

module Instmem (input [7:0] addr, output [31:0] data_out);
reg [7:0] mem [0:255];

 initial begin
 //Iman
$readmemh("C:/Users/Sabouzeid0/Desktop/machinecode.hex", mem);
//{mem[3],mem[2],mem[1], mem[0]}= 32'b00000000100000000010000010000011; //lw x1, 8(x0)
//{mem[7],mem[6],mem[5], mem[4]}= 32'b00000000000000000010001000000011; //lw x4, 0(x0)
//{mem[11],mem[10],mem[9], mem[8]}= 32'b00000000010000000010001110000011; //lw x7, 4(x0)
//{mem[15],mem[14],mem[13], mem[12]}= 32'b00000000000100001000000100110011; //add x2, x1, x1
//{mem[19],mem[18],mem[17], mem[16]}= 32'b01000000000100010000000110110011; //sub x3, x2, x1
//{mem[23],mem[22],mem[21], mem[20]}= 32'b00000000010000010100001010110011; //xor x5, x2, x4
//{mem[27],mem[26],mem[25], mem[24]}= 32'b00000000000100001110001100110011; //or x6, x1, x1
//{mem[31],mem[30],mem[29], mem[28]}= 32'b01000000100000001101010000110011; //sra x8, x1, x8 
//{mem[35],mem[34],mem[33], mem[32]}= 32'b00000000000100010101010010110011; //srl x9, x2, x1
//{mem[39],mem[38],mem[37], mem[36]}= 32'b00000000000100010011010100110011; //sltu x10, x2, x1
//{mem[43],mem[42],mem[41], mem[40]}=32'b00000000000100010001010110110011; //sll x11, x2, x1
//{mem[47],mem[46],mem[45], mem[44]}=32'b11111110110000001000001100010011; //addi x6, x1, -20
//{mem[51],mem[50],mem[49], mem[48]}=32'b00000000011000001010001110110011; //slt x7, x1,x6
//{mem[55],mem[54],mem[53], mem[52]}= 32'b00000001001100010100001000010011; //xori x4, x2, 19
//{mem[59],mem[58],mem[57], mem[56]}= 32'b00000001100100010110001000010011; //ori x4, x2, 25
//{mem[63],mem[62],mem[61], mem[60]}= 32'b00000000110000000000000010000011 ; //lb x1, 12(x0)


//{mem[67],mem[66],mem[65], mem[64]}= 32'b00000000101100000000000000100011 ; //sb x11, 12(x0)
//{mem[71],mem[70],mem[69], mem[68]}= 32'b00000000110000000001001000100011 ; //sh x12, 16(x0) 
//{mem[75],mem[74],mem[73], mem[72]}= 32'b00000000010000001000001101100011; //beq x10, x7, 
//{mem[79],mem[78],mem[77], mem[76]}= 32'b00000000000100100001000001100011; //bne x4, x1, L1
//{mem[83],mem[82],mem[81], mem[80]}= 32'b00000000100001001101000001100011; //bge x9, x8, L1
//{mem[87],mem[86],mem[85], mem[84]}= 32'b00000000001100110100000001100011; //blt x6, x3, L1
//{mem[91],mem[90],mem[89], mem[88]}= 32'b00000000100001001111000001100011; //bgeu  x9, x8, L1
//{mem[95],mem[94],mem[93], mem[92]}= 32'b00000000001100110110000001100011; //bltu x6, x3, L1
//{mem[99],mem[98],mem[97], mem[96]}= 32'b00000000000001010000000100110111; //lui



////Sara
//{mem[103],mem[102],mem[101], mem[100]}= 32'b00000000101000000010010000100011 ; //sw x10,8(x0)
//{mem[107],mem[106],mem[105], mem[104]}= 32'b00000000101100000000000000100011 ; //sb x11, 12(x0)
//{mem[111],mem[110],mem[109], mem[108]}= 32'b00000000110000000001001000100011 ; //sh x12, 16(x0) 
//{mem[115],mem[114],mem[113], mem[112]}= 32'b00000000010000001000001101100011; //beq x10, x7, 
//{mem[119],mem[118],mem[117], mem[116]}= 32'b00000000000100100001000001100011; //bne x4, x1, L1
//{mem[123],mem[122],mem[121], mem[120]}= 32'b00000000100001001101000001100011; //bge x9, x8, L1
//{mem[127],mem[126],mem[125], mem[124]}= 32'b00000000001100110100000001100011; //blt x6, x3, L1
//{mem[131],mem[130],mem[129], mem[128]}= 32'b00000000100001001111000001100011; //bgeu  x9, x8, L1
//{mem[135],mem[134],mem[133], mem[132]}= 32'b00000000001100110110000001100011; //bltu x6, x3, L1
////Ramy
////{mem[139],mem[138],mem[137], mem[136]}= 32'b00000000000001010000000100110111; //lui
////{mem[143],mem[142],mem[141], mem[140]}= 32'b00000000000000101000001010010111; //auipc
////{mem[147],mem[146],mem[145], mem[144]}= 32'b11111111100111111111000011101111; //jal 
////new
//{mem[151],mem[150],mem[149], mem[148]}=32'b00000000000000000000000001110011 ; //ecall
//{mem[155],mem[154],mem[153], mem[152]}= 32'b00000000000100000000000001110011;
end 
assign data_out = {mem[addr +3],mem[addr+2],mem[addr+1],mem[addr]};
 
endmodule

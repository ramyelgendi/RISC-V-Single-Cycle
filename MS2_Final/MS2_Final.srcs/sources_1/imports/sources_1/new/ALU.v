`timescale 1ns / 1ps
module ALU # (parameter n = 32) (input[n-1:0]  a, b , input [3:0] sel , output reg  [n-1:0] ALUresult , output reg FinalFlag);
wire [31:0] results1, results2, results3, results4;
assign results1= a&b ; 
assign results2 = a|b;
Adder A1 (a,b, sel, results3);
assign results4 = results3;
//assign ALUresult = results2;
//MUX_4x1 Mt1 (results1, results2, results3, results4, sel , ALUresult);

always @(*)
 begin
    case(sel)
    4'b0000: ALUresult = results1; //and
    4'b0001: ALUresult = results2;  //or
    4'b0010: ALUresult =results3;  //add
    4'b0110: ALUresult =results4;  //sub
    4'b1111: ALUresult = $signed(a) >> b;   //sra &srai
    4'b1110: ALUresult =  (a >> b); //srl &srli
    4'b1101: ALUresult = (a^b); //xor
    4'b1100: ALUresult = (a<b); //sltu
    4'b1011: ALUresult =  $signed(a)<$signed(b); //slt & slti
    4'b1001: ALUresult = a << b; //sll & slli
    4'b1000: ALUresult = $signed(a >= b) ; //BGE
    4'b0111: ALUresult = (a >= b); //BGEU
    4'b0100: ALUresult = results3; //SH
    4'b0011: ALUresult = {a[31:12],12'b0}; //LUI
    endcase
end

always@(*)
    begin 
    case(sel)
    4'b0010: begin //BEQ
         if(ALUresult == 0) begin
         FinalFlag = 1;
          #50;
                 FinalFlag = 0;
         end
         else begin
         FinalFlag = 0;
        
         end
    end
    4'b0100: begin //BNE
        if(ALUresult == 0) begin
        FinalFlag = 0;
               end
        else  begin
        FinalFlag = 1;
        #50;
        FinalFlag = 0;
        end
    end
    4'b1011: begin //BLT
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
         FinalFlag = 1;
                #50;
                FinalFlag = 0;
                end
    end
    4'b1100: begin //BLTU
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
         FinalFlag = 1;
                #50;
                FinalFlag = 0;
                end
    end
    4'b1000: begin //BGE
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
      FinalFlag = 1;
                #50;
                FinalFlag = 0;
                end
    end
        4'b0111: begin //BGEU
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
        FinalFlag = 1;
                #50;
                FinalFlag = 0;
                end
    end
    endcase
    end
endmodule

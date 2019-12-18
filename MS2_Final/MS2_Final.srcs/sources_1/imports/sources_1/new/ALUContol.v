`timescale 1ns / 1ps

module ALUControl( input [1:0] ALUop , input [2:0]inst , input inst2 ,new, output reg [3:0] ALUsel);
always @(*)
begin 

    if (ALUop == 2'b00) begin//Load and store
      if(inst == 3'b000)
          ALUsel =4'b0010;
      if(inst == 3'b001)
          ALUsel = 4'b0100;
      if(inst == 3'b010)
          ALUsel = 4'b0010;  
      if(inst == 3'b100)
          ALUsel = 4'b0010;
      if(inst == 3'b101)
            ALUsel = 4'b0010;  
end

    else if (ALUop ==2'b11) //U-format 
    ALUsel = 4'b0011; // LUI & AUIPC

    else if (ALUop == 2'b01)
    begin //SB-Format
    
    if(inst == 3'b000)  //BEQ
    ALUsel = 4'b0110;
    
    else if(inst == 3'b001) //BNE
      ALUsel =4'b0100; 
    
    else if(inst == 3'b100) // BLT
    ALUsel = 4'b1011;
    
    else if(inst == 3'b101) //BGE
    ALUsel = 4'b1000;
    
    else if(inst == 3'b110) //BLTU
    ALUsel = 4'b1100;
    
    else if(inst == 3'b111)//BGEU
    ALUsel = 4'b0111;
    
    end
    
    else if (ALUop ==2'b10)  // R-Format & I-Format 
    begin 
    if (inst == 3'b000)
     begin
        if (inst2 == 0) // add
        ALUsel = 4'b0010;
        if (new) //addi
        ALUsel = 4'b0010;
        else if (inst2 ==1) //sub  
        ALUsel = 4'b0110;
      end
    else if (inst == 3'b111 && inst2 == 0)  //and & andi
       begin
        ALUsel = 4'b0000;
       end
    else if (inst == 3'b110)  //or & ori
        ALUsel = 4'b0001;
    else if (inst == 3'b101)
       begin 
        if (inst2==0)  // srl & srli
            ALUsel= 4'b1110;
        else //sra & srai
            ALUsel= 4'b1111;
       end
    else if (inst == 3'b100)   //xor  & xori
         ALUsel= 4'b1101;
    else if (inst == 3'b011)  //sltu  & sltui                           
         ALUsel= 4'b1100;
    else if (inst == 3'b010)  //slt   & slti                        
          ALUsel= 4'b1011;
    else if (inst == 3'b001)  //sll & slli
          ALUsel= 4'b1001;
    end

end
endmodule

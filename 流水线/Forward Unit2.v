`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 16:35:17
// Design Name: 
// Module Name: Forward Unit2
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


module ForwardUnit2( input [4:0] IFReg_Rs,IFReg_Rt,EXReg_Rd,
                     input Branch,EX_RegWrite,
                     output reg forward3,forward4
      );
        always@(*)
         begin
          if(Branch && EX_RegWrite && (EXReg_Rd !=0 ) && (EXReg_Rd == IFReg_Rs)) forward3 = 1'b1;
          else forward3 = 1'b0;
        
          if(Branch && EX_RegWrite && (EXReg_Rd !=0 ) && (EXReg_Rd == IFReg_Rt)) forward4 = 1'b1;
          else forward4 = 1'b0;
     end  

                /*input [4:0] IFReg_Rs,IFReg_Rt,EXReg_Rd,MemReg_Rd,
                    input Branch,Mem_MemRead,
                    output  reg [1:0] ForwardA,ForwardB

    );
              always@(*) begin
                   if (Branch
                       && (IFReg_Rs == EXReg_Rd))          ForwardA = 2'b01;              // R->beq,Rs
                       else if (Branch && Mem_MemRead
                       && (IFReg_Rs == MemReg_Rd))         ForwardA = 2'b10;              //lw->beq,Rs
                            else ForwardA <= 2'b00 ;
                   if (Branch
                       && (IFReg_Rt == EXReg_Rd))          ForwardB = 2'b01;              //R->beq,Rt
                       else if (Branch && Mem_MemRead
                       && (IFReg_Rt == MemReg_Rd))         ForwardB = 2'b10;              //lw->beq,Rt
                            else  ForwardB <= 2'b00 ;
              end*/
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 16:34:07
// Design Name: 
// Module Name: Forward Unit_1
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


module ForwardUnit_1(input [4:0]IDReg_Rs,IDReg_Rt,EXReg_Rd,MEMReg_Rd,
                     input EX_RegWrite,MEM_RegWrite,
                     output reg [1:0] ForwardA,ForwardB
    );
           always@(*) begin
               if (EX_RegWrite 
                   && (EXReg_Rd != 0)
                   && (EXReg_Rd == IDReg_Rs)) ForwardA = 2'b10;          //1a 类
                   else if (MEM_RegWrite
                   &&(MEMReg_Rd != 0)
                   &&  !(EX_RegWrite && (EXReg_Rd != 0)
                      && (EXReg_Rd == IDReg_Rs))
                   && (MEMReg_Rd == IDReg_Rs)) ForwardA = 2'b01;       //2a类
                       else ForwardA = 2'b00;
               if (EX_RegWrite
                   && (EXReg_Rd != 0)
                   && (EXReg_Rd == IDReg_Rt)) ForwardB = 2'b10;         //1b 类
                   else  if  (MEM_RegWrite
                   &&(MEMReg_Rd != 0)
                   &&  !(EX_RegWrite && (EXReg_Rd != 0)
                      && (EXReg_Rd == IDReg_Rt))
                    && (MEMReg_Rd == IDReg_Rt)) ForwardB = 2'b01;     //2b类
                        else  ForwardB = 2'b00;
                    
           //    if  (MEM_RegWrite
           //        &&(MEMReg_Rd != 0)
          //         &&  !(EX_RegWrite && (EXReg_Rd != 0)
            //          && (EXReg_Rd != IDReg_Rs))
           //        && (MEMReg_Rd == IDReg_Rs)) ForwardA <= 2'b01;       //2a类
           //    if  (MEM_RegWrite
            //       &&(MEMReg_Rd != 0)
             //      &&  ~(EX_RegWrite && (EXReg_Rd != 0)
             //         && (EXReg_Rd != IDReg_Rt))
              //      && (MEMReg_Rd == IDReg_Rt)) ForwardA <= 2'b01;     //2b类
              //      
              //      else  ForwardA <= 2'b00 && ForwardB <= 2'b00;
           end
endmodule

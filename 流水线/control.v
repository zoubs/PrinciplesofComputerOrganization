`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/04 14:51:15
// Design Name: 
// Module Name: control
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

module control(
    input [5:0] opcode,
    output [11:0] contro
    );
    parameter jump   = 6'b000010;
    parameter R_type = 6'b000000;
    parameter lw     = 6'b100011;
    parameter sw     = 6'b101011;
    parameter addi   = 6'b001000;
    parameter addiu  = 6'b001001;
    parameter ori    = 6'b001101;
    parameter beq    = 6'b000100;
    parameter andi   = 6'b001100;
    parameter lui    = 6'b001111;

    //assign control[0]     //Sign
    //assign control[1]     //Jump
    //assign control[2]     //ALUsrc
    //assign control[3]     //ALUOp0
    //assign control[4]     //ALUOp1
    //assign control[5]     //ALUOp2
    //assign control[6]     //RegDst
    //assign control[7]     //MemWrite
    //assign control[8]    //MemRead
    //assign control[9]    //Branch
    //assign control[10]   //RegWrite
    //assign control[11]  //MemtoReg
     assign contro =  (opcode == jump)   ? (12'bxxxxxxxxxx0x) :           //jump
                      (opcode == R_type) ? (12'b010001010011) :          //R-type
                      (opcode == lw)     ? (12'b110100000110) :          //lw
                      (opcode == sw)     ? (12'bx0001x000110) :           //sw
                      (opcode == addi)   ? (12'b010000011111) :           //addi
                      (opcode == addiu)  ? (12'b010000011111) :           //addiu
                      (opcode == ori)    ? (12'b010000100110) :            //ori
                      (opcode == beq)    ? (12'bx0100xxxx010) :           //beq
                      (opcode == andi)   ? (12'b010000101110) :          //andi
                      (opcode == lui)    ? (12'b010000110110) :          //lui
                                           (12'bzzzzzzzzzzzz) ;
    
endmodule

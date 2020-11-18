`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 21:06:23
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
    output RegDst,
    output Sign,
    output Jump,
    output Branch,
    output MemtoReg,
    output [2:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite
    );
    
    wire [10:0] ALU;
    assign ALU = (opcode == 6'b000010) ? (11'bxxxxxxxxx0x) :           //jump
                 (opcode == 6'b000000) ? (11'b10010001011) :          //R-type
                 (opcode == 6'b100011) ? (11'b01110000010) :          //lw
                 (opcode == 6'b101011) ? (11'bx1x01000010) :           //sw
                 (opcode == 6'b001000) ? (11'b01010001111) :           //addi
                 (opcode == 6'b001001) ? (11'b01010001111) :           //addiu
                 (opcode == 6'b001101) ? (11'b01010010010) :            //ori
                 (opcode == 6'b000100) ? (11'bx0x00100110) :           //beq
                 (opcode == 6'b001100) ? (11'b01010010110) :          //andi
                                         (11'bzzzzzzzzzzz) ;
    assign RegDst = ALU[10];
    assign ALUSrc = ALU[9] ;
    assign MemtoReg = ALU [8];
    assign RegWrite = ALU [7];
    assign MemWrite = ALU [6];
    assign Branch = ALU[5];
    assign ALUOp = ALU[4:2];
    assign Jump = ALU[1];
    assign Sign = ALU[0];
    
endmodule

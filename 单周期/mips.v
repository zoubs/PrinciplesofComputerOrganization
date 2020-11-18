`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 20:58:09
// Design Name: 
// Module Name: mips
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


module mips(input clk,input rst ,output [31:0]pc);
            wire RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Branch,Jump,Sign;
            wire [2:0]ALUOp;
            wire [5:0] opcode;
            
            datapath Datapath (clk,rst,RegDst,Sign,Jump,Branch,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,opcode,pc);
            control Control(opcode, RegDst,Sign,Jump,Branch, MemtoReg,ALUOp, MemWrite, ALUSrc,RegWrite);     
            
endmodule

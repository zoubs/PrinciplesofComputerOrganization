`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 12:14:31
// Design Name: 
// Module Name: datapath
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


module datapath(input clk,rst,
                input REgDst,
                input SIgn,
                input JUmp,
                input BRanch,
                input MEmtoReg,
                input [2:0] ALUOP,
                input MEmWrite,
                input ALUSRc, 
                input REgWrite,
                output [5:0] OPcode,
                output [31:0]Pc
    );
    wire [31:0] Npc,regread1,regread2,instru,aluresult,dmout,Immeextend;
    wire [3:0] aluctr;
    wire Zero;
    
    pc PC(.clk(clk),.rst(rst),.npc(Npc),.addr(Pc));
    im IM(Pc,instru);
    regfile REGFILE(clk,rst,REgWrite,instru[25:21],instru[20:16],instru[15:11],REgDst,dmout,regread1,regread2);
    npc NPC(Pc,JUmp,Zero,BRanch,instru[25:0],Immeextend,Npc);
    ALU alu(ALUSRc,aluctr,Immeextend,regread1,regread2,Zero,aluresult);
    dm DM(aluresult,MEmWrite,clk,rst,regread2,MEmtoReg,dmout);
    ALuctr ALUctr (instru[5:0],ALUOP,aluctr);
    extend Extend(instru[15:0],SIgn,Immeextend);
    assign OPcode = instru[31:26];
    
endmodule

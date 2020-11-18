`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/04 16:03:42
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


module datapath (input clk,
                 input rst,
                 input [11:0] Control,
                 output [5:0] opcode
    );
    wire [31:0] pc_br,pc_j,Pc,pc_plus,imout,instru,read_1,read_2,pc_plus_1,imex,Imex,dmin,dm_read,dmread,
    pc_mux,Npc,WriteBack,read_3,read_4,comparesrc_1,comparesrc_2,alusrc_1,alusrc_2,alusrc_3,result,aluresult,Aluresult;
    wire [4:0] EX,IDReg_Rs,IDReg_Rt,IDReg_Rd,IDReg_Rd_1,IFReg_Rs,IFReg_Rt,IFReg_Rd,EXReg_Rd,MemReg_Rd; //IDReg_Rd为选择后的
    wire [3:0] ALUctr;
    wire [1:0] WB,WB_1,WB_2,ForwardA_1,ForwardB_1;
    wire [2:0] M,M_1,ALUOp;
    wire ForwardB_2,ForwardA_2,PCSrc,RegDst,ALUSrc,MemtoReg,MemRead,RegWrite,MemWrite,Branch,Branch_1,Branch_2,Jump,Sign,zero,
          PCWrite,IFflush,IFWrite,CTRflush,ID_MemRead,ID_MemtoReg,ID_RegWrite,EX_MemRead,
          EX_RegWrite;
    
    assign opcode = instru[31:26];
    assign Sign = Control [0];
    assign Jump = Control [1];
    assign Branch = Control [9];
    assign RegDst = EX[4];
    assign ALUOp  = EX[3:1];
    assign ALUSrc = EX[0];
    assign MemRead = M[1];
    assign MemWrite = M[0];
    assign MemtoReg = WB[1];
    assign RegWrite = WB[0];
    assign EX_MemRead = M[1];
    assign EX_RegWrite = WB_2[0];
    assign ID_MemRead = M_1[1];
    assign ID_MemtoReg = WB_1[1];
    assign ID_RegWrite = WB_1[0];
    assign IFReg_Rs = instru[25:21];
    assign IFReg_Rt = instru[20:16];
    assign IFReg_Rd = instru[15:11];
    assign Branch_2 = Branch_1 & Branch;
    
    mux_32 MUX1 (.a(pc_plus),.b(pc_br),.c(PCSrc),.o(pc_mux)) ;
    mux_32 MUX2 (.a(pc_j),.b(pc_mux),.c(Jump),.o(Npc));
    pc PC (clk,rst,PCWrite,Npc,Pc);
    im IM (Pc,imout);
    add ADD (Pc,pc_plus);
    npc NPC (instru,imex,pc_plus_1,pc_br,pc_j);
    IFID ifid (clk,rst,IFflush,IFWrite,pc_plus,imout,pc_plus_1,instru);
    regfile REGFILE (rst,RegWrite,IFReg_Rs,IFReg_Rt,MemReg_Rd,WriteBack,read_1,read_2);
    HazardUnit HAZARDUNIT (IDReg_Rd,IFReg_Rs,IFReg_Rt,EXReg_Rd,ID_MemRead,ID_RegWrite,EX_RegWrite,PCSrc,Jump,EX_MemRead,Branch,PCWrite,IFflush,CTRflush,IFWrite,Branch_1);
    ForwardUnit2 FORWARDUNIT2 (IFReg_Rs,IFReg_Rt,EXReg_Rd,Branch,EX_RegWrite,ForwardA_2,ForwardB_2);
    compare COMPARE (comparesrc_1,comparesrc_2,zero);
    andgate ANDGATE (Branch_2,zero,PCSrc);
    mux_32 beqMUX1 (read_1,aluresult,ForwardA_2,comparesrc_1);
    mux_32 beqMUX2 (read_2,aluresult,ForwardB_2,comparesrc_2);
    extend EXTEND (instru[15:0],Sign,imex);
    IDEX idex (clk,CTRflush,read_1,read_2,imex,Control,IFReg_Rs,IFReg_Rt,IFReg_Rd,IDReg_Rs,IDReg_Rt,IDReg_Rd_1,read_3,read_4,Imex,EX,WB_1,M_1);
    mux3to1 M3_1alu1 (read_3,WriteBack,aluresult,ForwardA_1,alusrc_1);
    mux3to1 M3_1alu2(read_4,WriteBack,aluresult,ForwardB_1,alusrc_3);
    mux_32 MUX3(alusrc_3,Imex,ALUSrc,alusrc_2);
    mux_5 MUX4 (IDReg_Rt,IDReg_Rd_1,RegDst,IDReg_Rd);
    ForwardUnit_1 FORWARDUNIT_1 (IDReg_Rs,IDReg_Rt,EXReg_Rd,MemReg_Rd,EX_RegWrite,RegWrite,ForwardA_1,ForwardB_1);
    ALU alu (ALUctr,alusrc_1,alusrc_2,result);
    ALuctr ALUCTR (Imex[5:0],ALUOp,ALUctr);
    EXMEM exmem (clk,WB_1,M_1,result,alusrc_3,IDReg_Rd,aluresult,dmin,EXReg_Rd,WB_2,M);
    dm Dm (aluresult,MemWrite,MemRead,rst,dmin,dm_read);
    MEMWB memwb (clk,WB_2,dm_read,aluresult,EXReg_Rd,dmread,Aluresult,MemReg_Rd,WB);
    mux_32 MUX5 (Aluresult,dmread,MemtoReg,WriteBack);
    
endmodule

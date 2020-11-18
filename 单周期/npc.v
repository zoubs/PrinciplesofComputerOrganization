`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 16:18:56
// Design Name: 
// Module Name: npc
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


module npc(input [31:0] pc,
           input Jump,zero,Branch,
           input [25:0] j,
           input [31:0] immeextend,
           output [31:0] npc
            );
           wire pcsrc;
           wire [31:0] jaddr;    
           wire [31:0] pc_plus;    
           wire [31:0] pc_br;            //pc branch
           wire [31:0] immeextendsll;              
           wire [27:0] jextend;  //pc jump
           wire [31:0] pc_mux;
           assign pcsrc = Branch & zero;
           assign pc_plus = pc+4;
           assign jextend = {j,2'b00};
           
           assign immeextendsll = {immeextend[29:0],2'b00};
           assign pc_br = immeextendsll+pc_plus;             //pc branch
           assign jaddr = {pc_plus[31:28],jextend};        //pc jump
           mux_32 MUX1 (.a(pc_plus),.b(pc_br),.c(pcsrc),.o(pc_mux)) ;
           mux_32 MUX2 (.a(jaddr),.b(pc_mux),.c(Jump),.o(npc));
           
endmodule

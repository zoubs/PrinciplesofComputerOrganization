`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:32:47
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


module npc(input [31:0] instru,
           input [31:0] immeextend,pc_plus,
           output [31:0] pc_br,pc_j
            );
           
           wire [25:0] j;
           wire [31:0] immeextendsll;              
           wire [27:0] jextend;  //pc jump
           
           assign j = instru [25:0];
           assign jextend = {j,2'b00};
           assign immeextendsll = {immeextend[29:0],2'b00};
           assign pc_br = immeextendsll+pc_plus;             //pc branch
           assign pc_j = {pc_plus [31:28],jextend};        //pc jump
endmodule

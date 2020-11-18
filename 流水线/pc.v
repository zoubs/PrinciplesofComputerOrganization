`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 15:30:32
// Design Name: 
// Module Name: pc
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


module pc( input clk,
           input rst,PCWrite,
           input [31:0]npc,
           output reg[31:0]addr);
           always @(posedge clk )
           begin 
               if(rst)  
                    addr <= 32'b11_0000_0000_0000; 
               else if (PCWrite)
                    addr <= npc;
           end
           
endmodule


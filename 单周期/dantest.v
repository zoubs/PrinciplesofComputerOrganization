`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 14:08:16
// Design Name: 
// Module Name: dantest
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


module dantest;
         reg clk,rst;
         wire [31:0] pc;
         mips Mips(clk,rst,pc);
         initial 
         begin
         clk=0;
         rst=1;
         #50;
         clk=1;
         #50;
         rst=0;
         clk=0;
         forever #50 begin
         clk=!clk;
         end
         end
endmodule

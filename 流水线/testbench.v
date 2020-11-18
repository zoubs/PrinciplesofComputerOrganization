`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 19:45:24
// Design Name: 
// Module Name: testbench
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


module testbench;
         reg clk,rst;
         mips Mips(clk,rst);
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

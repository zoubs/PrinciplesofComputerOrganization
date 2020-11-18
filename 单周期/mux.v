`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 17:16:26
// Design Name: 
// Module Name: mux
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


module mux_32(input [31:0] a,
              input [31:0] b,
              input        c,
              output [31:0] o
               );
               assign o=c?b:a;
endmodule
module mux_5(input [4:0] a,
             input [4:0] b,
             input       c,
              output [4:0] o
               );
               assign o=c?b:a;
endmodule

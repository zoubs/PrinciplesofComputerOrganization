`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 16:38:23
// Design Name: 
// Module Name: mux3-1
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


module mux3to1(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [1:0] Forward,
    output  [31:0] d
    );
    assign d = (Forward == 2'b00) ? a :
               (Forward == 2'b01) ? b :
               (Forward == 2'b10) ? c :
               32'bzz;
endmodule

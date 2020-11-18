`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:27:47
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [3:0] ALUctr,
    input [31:0] src_1,
    input [31:0] src_2,
    output reg [31:0]result   
    );
    wire signed [31:0] br1,br2;
    assign br1 = src_1;
    assign br2 = src_2;
    always@(*)
    begin
    case(ALUctr)
    4'b0010 : result = src_1 + src_2;
    4'b0110 : result = src_1 - src_2;
    4'b0000 : result = src_1 & src_2;
    4'b0001 : result = src_1 | src_2;
    4'b0111 : result = (br1 < br2) ? 1:0;
    4'b0011 : result = (src_1 < src_2) ? 1:0;
    4'b0100 : result = {src_2[15:0] , 16'b0} | 32'b0;
    endcase
    end
endmodule

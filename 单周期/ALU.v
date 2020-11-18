`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 20:40:34
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
    input ALUSrc,
    input [3:0] ALUctr,
    input [31:0] immeextend,
    input [31:0] read_1,
    input [31:0] read_2,
    output zero, 
    output reg [31:0]result   
    );
    wire [31:0] ALUsrc; 
    wire signed [31:0] br1,br2;
    mux_32 MUX (.a(read_2),.b(immeextend),.c(ALUSrc),.o(ALUsrc));
    assign zero=(result==0)?1:0;
    assign br1 = read_1;
    assign br2 = read_2;
    always@(*)
    begin
    case(ALUctr)
    4'b0010 : result = read_1 + ALUsrc;
    4'b0110 : result = read_1 - ALUsrc;
    4'b0000 : result = read_1 & ALUsrc;
    4'b0001 : result = read_1 | ALUsrc;
    4'b0111 : result = (br1< br2) ? 1:0;
    endcase
    end
endmodule

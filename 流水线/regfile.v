`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:19:34
// Design Name: 
// Module Name: regfile
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


module regfile(
    input rst,RegWrite,
    input [4:0] rs,rt,Waddr,
    input [31:0] WB,
    output [31:0] read_1,
    output [31:0] read_2
    );
    integer i;
    reg [31:0] rf[31:0];
    always@(*)
    begin
         if(rst)
            for(i=0;i<32;i=i+1) rf[i]<=0;
    if(RegWrite) rf[Waddr] <= WB;
    end
    assign read_1 = (rs==0) ? 32'b0 : rf[rs];
    assign read_2 = (rt==0) ? 32'b0 : rf[rt];
endmodule

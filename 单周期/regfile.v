`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 17:31:18
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
    input clk,rst,RegWrite,
    input [4:0] rs,rt,rd,
    input RegDst,
    input [31:0] WB,
    output [31:0] read_1,
    output [31:0] read_2
    );
    integer i;
    reg [31:0] rf[31:0];
    wire [4:0] Waddr;
    mux_5 MUX(.a(rt),.b(rd),.c(RegDst),.o(Waddr));
    mux_32 MUX1 (rt,rd,RegDst,Waddr);
    always@(posedge clk )
    begin
         if(rst)
            for(i=0;i<32;i=i+1) rf[i]<=0;
    if(RegWrite) rf[Waddr] <= WB;
    end
    assign read_1 = (rs==0) ? 32'b0 : rf[rs];
    assign read_2 = (rt==0) ? 32'b0 : rf[rt];
endmodule

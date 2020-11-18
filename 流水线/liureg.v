`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 11:10:38
// Design Name: 
// Module Name: liureg
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


module IFID(input clk,rst,IFflush,IFWrite,
            input [31:0] pc_plus,iout,
            output  [31:0] PC_plus,Iout
 );
        reg [63:0] IF;
        always@(posedge clk) begin
           if(rst) IF=64'b0;
           if(IFflush) IF=64'b0;
              else if (IFWrite) begin
                   IF[63:32] = pc_plus;
                   IF[31:0] = iout; end
        end
        assign PC_plus = IF[63:32];
        assign Iout    = IF[31:0];
            
endmodule
module IDEX(  input clk,ctrflush,
              input [31:0] read_1,read_2,imex,
              input [11:0] contro,              //ÎÞJump ¡¢Sign
              input [4:0] rs,rt,rd,
              output [4:0] Rs,Rt,Rd,
              output [31:0] Read_3,Read_4,Imex,
              output  [4:0] EX,
              output  [1:0] WB,
              output  [2:0] M
                        
    );
             reg [147:0] ID;
             always@(posedge clk) begin
                 if(ctrflush) ID[147:138] = 10'b0;
                         else ID [147:138]<= contro[11:2]; 
                  ID [4:0]    <= rd;
                  ID [9:5]    <= rt;
                  ID [41:10]  <= imex;
                  ID [73:42]  <= read_2;
                  ID [105:74] <= read_1;
                  ID [110:106]<= rs;
                  
             end
            assign WB   = ID[147:146];
            assign M    = ID[145:143];
            assign EX   = ID[142:138];
            assign Rs = ID[110:106];
            assign Read_3  = ID[105:74];
            assign Read_4  = ID[73:42];
            assign Imex    = ID[41:10];
            assign Rt      = ID[9:5];
            assign Rd      = ID[4:0];
endmodule

module EXMEM( input clk, 
              input [1:0]WB,
              input [2:0]M,
              input[31:0] result,read_2,
              input [4:0] Regd,             //WriteBack regsister
              output[31:0] Result,Read_2,
              //output [31:0] PC_br
              //output Zero,
              output [4:0]RegD,
              output [1:0] WB_o,
              output [2:0] M_o
   );
            reg [106:0] EX;
            always@(posedge clk) begin
                 EX[106:105] <= WB;
                 EX[104:102] <= M;
                // EX[101:70]  <= pc_br;
                // EX[69]      <= zero;
                 EX[68:37]   <= result;
                 EX[36:5]    <= read_2;
                 EX[4:0]     <= Regd;
            end
            assign WB_o   = EX[106:105];
            assign M_o    = EX[104:102];
           // assign PC_br  = EX[101:70];
           // assign Zero   = EX[69];
            assign Result = EX[68:37];
            assign Read_2 = EX[36:5];
            assign RegD   = EX[4:0];
            
 endmodule
 
module MEMWB( input clk,
              input [1:0]WB_2,
              input [31:0]dm_read,aluresult,
              input [4:0] Regd,
              output[31:0]DmRead,Aluresult,
              output[4:0] RegD,
              output [1:0]WB
);
         reg [70:0] ME;
         always@(posedge clk) begin
                ME[70:69] <= WB_2;
                ME[68:37] <= dm_read;
                ME[36:5]  <= aluresult;
                ME[4:0]   <= Regd;
         end  
         assign WB        = ME[70:69];
         assign DmRead    = ME[68:37];
         assign Aluresult = ME[36:5];
         assign RegD      = ME[4:0];
endmodule
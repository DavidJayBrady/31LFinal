`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 08:31:49 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input logic [5:0] rs,
    input logic [5:0] rt,
    input logic [5:0] rd,
    input logic [31:0] wd,
    input logic WE1,
    input logic clock,
    output logic [31:0] rd1,
    output logic [31:0] rd2
    );
    parameter memory_width = 32;
    logic [memory_width-1:0] memory [63:0];
    
    assign memory[0] = 0;

    always_ff @(posedge clock) begin
        // the != 6'b000000 is to prohibit writing into memory[0]
        if (WE1 == 1'b1 & rd != 6'b000000)
            memory[rd] <= wd;
    end
    
//    always @(negedge clock) begin
//        rd1 <= memory[rs];
//        rd2 <= memory[rt];
//    end

    always_comb begin
        rd1 <= memory[rs];
        rd2 <= memory[rt];
    end
 
endmodule

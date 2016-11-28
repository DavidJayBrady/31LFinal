`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 08:58:39 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input logic clock,
    input logic [31:0] address,
    input logic [31:0] wd,
    input logic WE2,
    output logic [31:0] ReadData
                );
                
    logic [31:0] memory [63:0];
        
    always_ff @(posedge clock) begin
            if (WE2/* == 1'b1*/) 
                memory[address] <= wd;
    end
    
    assign ReadData = memory[address];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 07:48:08 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input logic clk,
    input logic rst,
    output logic [5:0] count
    );
        
    always_ff @(posedge clk) begin
        if (count < 63) begin
            count <= count + 1;
        end
        else begin
            count <= 6'b000000;
        end
        if (rst == 1'b1) begin
            count <= 6'b000000;
        end;
    end
endmodule
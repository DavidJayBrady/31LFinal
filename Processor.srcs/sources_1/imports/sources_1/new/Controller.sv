`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 09:11:02 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
        input logic [31:0] instruction,
        output logic [5:0] rs,
        output logic [5:0] rd,
        output logic [5:0] rt,
        output logic [14:0] immediate,
        output logic [3:0] funct, // going into ALU
        output logic MUXsel1,
        output logic MUXsel2,
        output logic WE1,
        output logic WE2 
    );
    // because funct is an output, other outputs can't depend on
    // it. so we make a place holder to do the job in our conditionals
    logic [3:0] placeHolder;
    assign placeHolder = instruction[18:15];

    assign rs = instruction[30:25];
    assign rd = instruction[24:19];
    assign rt = instruction[14:9];
    assign immediate = instruction[14:0];

    assign MUXsel1 = instruction[31];
    assign MUXsel2 = (placeHolder == 4'b0100)? 0: // 0100 is load
                                         1;           

    // to have our "do nothing" operation, all I do is zero out
    // the write enables. this way, no changes will be left over
    // for the next instruction.
    assign WE1 = (placeHolder == 4'b1111 | placeHolder == 4'b0110)? 0: // 0110 is store
                                                        1;
    assign WE2 = (placeHolder == 4'b1111)? 0:
                                  ~WE1;
    /* 
    * if instruction[18:15] says to store or load, we want our ALU
    * to perform MOVE operation, so the address isn't changed
    * otherwise, it can be what instruction[18:15] says it should be
    */
    always_comb begin
        if ((instruction[18:15] == 4'b0110) | (instruction[18:15] == 4'b0100))
            funct = 4'b0010;
        else
            funct = instruction[18:15];
    end     
    
endmodule
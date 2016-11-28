`timescale 1ns / 1ps

module processor(
    input logic clock,
    input logic rst,
    output logic [31:0] reg_write_data
    );
                
    wire [5:0] count;
    wire [31:0] instruction;
    Counter counter (.clk(clock), .rst(rst), .count(count));
    
    InstructionMemory instructmemory (.count(count), .instruction(instruction));
    
    wire [5:0] rs, rt, rd;
    wire [31:0] wd;
    wire [14:0] immediate;
    wire [3:0] funct;
    wire MuxSel1;
    wire MuxSel2;
    wire WE1;
    wire WE2;
    Controller absoluteKontrol (.instruction(instruction), .rs(rs), .rd(rd), .rt(rt), .immediate(immediate),
                .funct(funct), .MUXsel1(MuxSel1), .MUXsel2(MuxSel2), .WE1(WE1), .WE2(WE2));
    
    wire [31:0] rd1, rd2;
    RegFile regfile(.rs(rs), .rt(rt), .rd(rd), .wd(wd), .WE1(WE1), .clock(clock), .rd1(rd1), .rd2(rd2));
    
    wire [31:0] extendedImmediate;
    SignExtender signextender(.A(immediate), .extended(extendedImmediate));
    
    wire [31:0] ALU_B;
    
    MUX2_1 mux1(.a(rd2), .b(extendedImmediate), .sel(MuxSel1), .out(ALU_B));
    
    wire [31:0] ALU_RESULT;
    
    ALU32B alu32b(.op1(rd1), .op2(ALU_B), .opsel(funct[2:0]), .mode(funct[3]),
            .result(ALU_RESULT), .c_flag(), .z_flag(), .o_flag(), .s_flag());
    
    logic [31:0] memoryData;
    DataMemory datamemory(.clock(clock), .address(ALU_RESULT),
                    .wd(rd2), .WE2(WE2), .ReadData(memoryData));
                    
    MUX2_1 mux2(.a(memoryData), .b(ALU_RESULT), .sel(MuxSel2), .out(wd));
    
    assign reg_write_data = (funct == 4'b0110)? rd2:
                                                 wd;
    
endmodule
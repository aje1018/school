`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 06:54:57 PM
// Design Name: 
// Module Name: SSD
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


module SSD(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [3:0] in5,
    input [3:0] in6,
    input [3:0] in7,
    input clk,
    output [3:0] AN,
    output [6:0] SSD
    );
    
    wire slow_clock;
    wire [3:0] decode;
    wire [2:0] select;
    
    decoder D1(.in(decode), .ss(SSD));
    
    mux_8to1 M81(.in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .sel(select),
    .out(decode));
    
    clock_divider CL1(.clk_in(clk), .clk_out(slow_clock));
    
    three_bit_counter TBC1(.clk(slow_clock), .reset(), .out(select));
    
    anode_decoder AD1(.in(select), .AN(AN));
    
endmodule

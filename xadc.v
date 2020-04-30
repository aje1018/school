`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 07:06:24 PM
// Design Name: 
// Module Name: xadc
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


module xadc(
    input clk,
    input AUXP6,
    input AUXN6,
    /*input AUXP7,
    input AUXN7,
    input AUXP15,
    input AUXN15,
    input AUXP14,
    input AUXN14,
    input [1:0] SW,*/
    output reg [15:0] LD,
    output [3:0] AN,
    output [6:0] SSD
    );
    
    // variables for XADC instantiation
    wire enable;
    wire ready;
    wire [15:0] data;
    //reg [6:0] addr;
    reg [32:0] remainder;
    
    // variables for input to ssd
    reg [3:0] num0;
    reg [3:0] num1;
    reg [3:0] num2;
    reg [3:0] num3;
    reg [3:0] num4;
    reg [3:0] num5;
    reg [3:0] num6;
    
    // xadc instantiation
    xadc_wiz_0 xadc(.daddr_in(8'h16),
    .dclk_in(clk),
    .den_in(enable),
    .di_in(),
    .dwe_in(),
    .busy_out(),
    .vauxp6(AUXP6),
    .vauxn6(AUXN6),
    /*.vauxp7(AUXP7),
    .vauxn7(AUXN7),
    .vauxp14(AUXP14),
    .vauxn14(AUXN14),
    .vauxp15(AUXP15),
    .vauxn15(AUXN15),*/
    .vn_in(),
    .vp_in(),
    .alarm_out(),
    .do_out(data),
    .eoc_out(enable),
    .channel_out(),
    .drdy_out(ready));
    
    
    always @(posedge clk) begin
        if (ready == 1) begin
            case (data[15:12])
                1:  LD <= 16'b11;
                2:  LD <= 16'b111;
                3:  LD <= 16'b1111;
                4:  LD <= 16'b11111;
                5:  LD <= 16'b111111;
                6:  LD <= 16'b1111111; 
                7:  LD <= 16'b11111111;
                8:  LD <= 16'b111111111;
                9:  LD <= 16'b1111111111;
                10: LD <= 16'b11111111111;
                11: LD <= 16'b111111111111;
                12: LD <= 16'b1111111111111;
                13: LD <= 16'b11111111111111;
                14: LD <= 16'b111111111111111;
                15: LD <= 16'b1111111111111111;                        
                default: LD <= 16'b1; 
            endcase
        end
    end
    
    reg [32:0] cnt;
    always @(posedge clk) begin
    
        if (cnt == 10000000) begin
            remainder = data >> 4;
            if (remainder >= 4093) begin
                num0 = 0; num1 = 0; num2 = 0; num3 = 0; num4 = 0; num5 = 0; num6 = 1; cnt = 0;
            end else begin
                remainder = remainder * 250000;
                remainder = remainder >> 10;
                
                num0 = remainder % 10;
                remainder = remainder / 10;
                
                num1 = remainder % 10;
                remainder = remainder / 10;
                
                num2 = remainder % 10;
                remainder = remainder / 10;
                
                num3 = remainder % 10;
                remainder = remainder / 10;
                
                num4 = remainder % 10;
                remainder = remainder / 10;
                
                num5 = remainder % 10;
                remainder = remainder / 10;
                
                num6 = remainder % 10;
                remainder = remainder / 10;
                
                cnt = 0;
            end
        end
        cnt = cnt + 1;
    end
    
    SSD SSD1(.in0(num0),
    .in1(num1),
    .in2(num2),
    .in3(num3),
    .in4(num4),
    .in5(num5),
    .in6(num6),
    .clk(clk),
    .AN(AN),
    .SSD(SSD));
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 04:00:06 PM
// Design Name: 
// Module Name: decoder
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


`timescale 1ns / 1ps
// Code your design here
module decoder(input [3:0] in, output reg [6:0] ss);
  
  always @(in) begin
    case (in)
      4'd0: ss = 7'b1000000;
      4'd1: ss = 7'b1111001;
      4'd2: ss = 7'b0100100;
      4'd3: ss = 7'b0110000;
      4'd4: ss = 7'b0011001;
      4'd5: ss = 7'b0010010;
      4'd6: ss = 7'b0000010;
      4'd7: ss = 7'b1111000;
      4'd8: ss = 7'b0000000;
      4'd9: ss = 7'b0011000;
      default: ss = 7'b0000110; // will display E for error
    endcase
    
  end
  
endmodule

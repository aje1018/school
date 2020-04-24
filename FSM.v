`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 05:21:44 PM
// Design Name: 
// Module Name: FSM
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


// Code your design here
module FSM(input SW0, SW1, BTNC, output reg LD0, reg LD1, reg LD2); // DC, DD, DN respectively outputs
  //reg LD0, LD1, LD2;
  reg [3:0] state;
  localparam A = 0;
  localparam B = 1;
  localparam C = 2;
  localparam D = 3;
  localparam E = 4;
  localparam F = 5;
  localparam G = 6;
  localparam H = 7;
  localparam I = 8;
  localparam J = 9;
  localparam K = 10;
  localparam L = 11;
  localparam M = 12;
  localparam N = 13;
  localparam O = 14;
  
  
  always @(posedge BTNC) begin
    //$display("start state: %d", state);
    LD0 <= 0;
    LD1 <= 0;
    LD2 <= 0;
    case (state)
      A: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= B;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= C;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= D;
        else // invalid input
          state <= A;
      end
      B: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= C;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= E;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= G;
        else // invalid input
          state <= A;
      end
      C: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= E;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= F;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= H;
        else // invalid input
          state <= A;
      end
      D: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= G;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= H;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= I;
        else // invalid input
          state <= A;
      end
      E: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= F;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= D;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= J;
        else // invalid input
          state <= A;
      end
      F: begin
        if (~SW1 && ~SW0)  // 00 -> input nickel
          state <= D;
        else if (~SW1 && SW0) // 01 -> input dime
          state <= G;
        else if (SW1 && ~SW0) // 10 -> input quarter
          state <= K;
        else // invalid input
          state <= A;
      end
      G: begin // 30 cents
        LD0 <= 1'b1; // dispense can
        state <= A; // go back to start
      end
      H: begin // 35 cents
        LD0 <= 1'b1; // dispense can
        state <= L; // go to next state to dispense nickel
      end
      I: begin // 50 cents
        LD0 <= 1'b1; // dispense can
        state <= M; // go to next state to dispense dime
      end
      J: begin // 40 cents
        LD0 <= 1'b1; // dispense can
        state <= O; // go to next state to dispense dime
      end
      K: begin
        LD0 <= 1'b1; // dispense can
        state <= N; // go to next state to dispense dime
      end
      L: begin
        LD2 <= 1'b1; // dispense nickel
        state <= A; // go back to start
      end
      M: begin
        LD1 <= 1'b1; // dispense dime
        state <= O; // go to next state to dispense another dime
      end
      N: begin
        LD1 <= 1'b1; // dispense dime
        state <= L; // go to next state to dispense nickel
      end
      O: begin
        LD1 <= 1'b1; // dispense dime
        state <= A; // go back to start
      end
      default: begin
        state <= A;
        LD0 <= 0;
        LD1 <= 0;
        LD2 <= 0;
      end
    endcase
    //$display("end state: %d", state);
  end
endmodule

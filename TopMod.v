`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 02:58:01 PM
// Design Name: 
// Module Name: TopMod
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


module TopMod(
    input clk,
    output Hsync, 
    output Vsync,
    output [4:0] Red,
    output [4:0] Blue,
    output [5:0] Green 
    );
    
    wire v_en,div;
    wire [15:0] vcnt_wire;
    wire [15:0] hcnt_wire;
    //reg [15:0] clk_div;
    
    clkdiv v1 (clk,div);
     
    Hcnt v2 (div, v_en, hcnt_wire);
    
    Vcnt v3 (div, v_en, vcnt_wire);
    
    // outputs
    assign Hsync = (hcnt_wire < 96) ? 1'b1 : 1'b0;
    assign Vsync = (vcnt_wire < 2) ? 1'b1 : 1'b0;

// colors - all colors high = white screen
 // colors - all colors high = white screen
    assign Red = (hcnt_wire < 784 && hcnt_wire > 143 && vcnt_wire < 515 && vcnt_wire > 34) ? 5'b11111 : 5'b00000;   // 5-bit max = 1F
    assign Green = (hcnt_wire < 784 && hcnt_wire > 143 && vcnt_wire < 515 && vcnt_wire > 34) ? 6'b111111 : 6'b000000; // 6-bit max = 3F
    assign Blue = (hcnt_wire < 784 && hcnt_wire > 143 && vcnt_wire < 515 && vcnt_wire > 34) ? 5'h11111 : 5'b00000;  // 5-bit max = 1F
    
endmodule 
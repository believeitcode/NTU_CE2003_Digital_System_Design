`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:08 01/31/2020 
// Design Name: 
// Module Name:    top_mod 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_mod(
    input clk,
    input rst,
    input write_en,
    input save_data,
    input show_reg,
    input [7:0] d_in,
    output [7:0] d_out,
    output seg_Tg_out,
    output [6:0] seg
    );
	 
	 wire clk_out;
	 wire save_out;
	 wire write_out;
	 

	// instances of memory module , clock generator module & two debounce module 
	clkGen_7seg clock(.i_clk(clk), .o_clk(o_clk), .seg_Tg_out(seg_Tg_out), .seg(seg));
	debounce save(.i_clk(clk_out), .i_swtch(save_data), .o_pulse(save_out));
	debounce write(.i_clk(clk_out), .i_swtch(write_en), .o_pulse(write_out));
	
	lut_mod memorymod(.clk(clk) , .rst(rst), .write_en(write_en), .save_data(save_data), .show_reg(show_reg), .d_in(d_in) ,.d_out(d_out));
	
	


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:20 01/30/2020 
// Design Name: 
// Module Name:    dff_mod 
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
module lut_mod(
    input clk,
    input rst,
    input write_en,
    input save_data,
    input show_reg,
    input [7:0] d_in,
    output [7:0] d_out
    );

reg[7:0] data_reg;
reg[7:0] ramdata[0:63];
wire[5:0] addr;

assign addr = d_in[5:0];


always @(posedge clk) 
  begin

		if(!rst) 
			data_reg <= 8'b00000000; 
		else if(save_data)
			data_reg <= d_in;
				
	  
	if(write_en)
		ramdata[addr] <= data_reg;
		
  end
	
assign d_out = show_reg? ramdata[addr] : data_reg; 	

endmodule



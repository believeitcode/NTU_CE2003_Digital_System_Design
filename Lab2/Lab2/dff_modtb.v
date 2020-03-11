`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:40 01/30/2020
// Design Name:   dff_mod
// Module Name:   E:/Lab2/dff_modtb.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dff_mod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dff_modtb;

	// Inputs
	reg clk;
	reg rst;
	reg write_en;
	reg save_data;
	reg show_reg;
	reg [7:0] d_in;

	// Outputs
	wire [7:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	lut_mod uut (
		.clk(clk), 
		.rst(rst), 
		.write_en(write_en), 
		.save_data(save_data), 
		.show_reg(show_reg), 
		.d_in(d_in), 
		.d_out(d_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		write_en = 0;
		save_data = 0;
		show_reg = 0;
		d_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 rst=1;
		#10 d_in = 8'h15;
		#10 save_data = 1;
		#10 save_data = 0; d_in = 8'h01;
		#10 write_en = 1;
		#10 write_en = 0;
		#10 d_in = 8'hA3;
		#10 save_data = 1;
		#10 save_data = 0; d_in = 8'h02;
		#10 write_en = 1;
		#10 write_en = 0;
		#10 d_in = 8'h87;
		#10 save_data = 1;
		#10 save_data = 0;
		#10 d_in = 8'h01;
		#10 show_reg = 1;
		#10 d_in = 8'h01; show_reg = 0;
		#10;
		$finish();

	end
	
	always #5 clk = ~clk;
      
endmodule


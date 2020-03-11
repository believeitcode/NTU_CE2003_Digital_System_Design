`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:00:12 01/18/2020
// Design Name:   FMS_vend
// Module Name:   /home/ise/VMShare/CE2003 Lab/Lab1/FMS_vend_tb.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FMS_vend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FMS_vend_tb;

	// Inputs
	reg rst;
	reg clk;
	reg c50;
	reg d1;
	reg cancel;

	// Outputs
	wire [1:0] st;
	wire insert_coin;
	wire money_return;
	wire dispense;

	// Instantiate the Unit Under Test (UUT)
	FMS_vend uut (
		.rst(rst), 
		.clk(clk), 
		.c50(c50), 
		.d1(d1), 
		.cancel(cancel), 
		.st(st), 
		.insert_coin(insert_coin), 
		.money_return(money_return), 
		.dispense(dispense)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		c50 = 0;
		d1 = 0;
		cancel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		clk = 0; rst = 0; c50 = 0; d1 = 0; cancel = 0;
		#10 rst = 1; // to INIT (0) state
		#10 c50 = 1; // to S50c (1) state
		#10 c50 = 0;
		#10 c50 = 1; // to VEND (2) state
		#10 c50 = 0;
		#20 rst = 0; // RESET, to INIT (0) state
		#10 rst = 1;
		#10 d1 = 1; // to VEND (2) state
		#10 d1 = 0;
		#20 rst = 0; // RESET, to INIT (0) state
		#10 rst = 1;
		#10 c50 = 1; // to S50c (1) state
		#10 c50 = 0;
		#10 d1 = 1; // to RETURN (3) state
		#10 d1 = 0; // to INIT (0) state
		#20 c50 = 1; // to S50c (1) state
		#10 c50 = 0;
		#10 cancel = 1; // to RETURN (3) state
		#10 cancel = 0; // to INIT (0) state
		#20 $finish();

	end
	
	always #5 clk = ~clk; //Toggle every 5 timestep 
      
endmodule


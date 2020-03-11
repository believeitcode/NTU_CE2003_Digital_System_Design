`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:04 01/17/2020 
// Design Name: 
// Module Name:    FMS_vend 
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
module FMS_vend(
    input rst,
    input clk,
    input c50,
    input d1,
    input cancel,
    output reg[1:0] st,
    output reg insert_coin,
    output reg money_return,
    output reg dispense
    );


parameter INIT=2'b00,s50=2'b01,VEND=2'b10,RETURN=2'b11;
reg[1:0] nst, cur_st;

always @ (posedge clk) begin
	if(!rst)
		cur_st<=INIT;
	else
		cur_st<=nst;			
end

always @* begin 
	nst = cur_st;
	case(cur_st)
		INIT: begin
			st = 2'b00;
			insert_coin = 1;
			money_return = 0;
			dispense = 0;
			if(c50)
				nst = s50;
			if(d1)
				nst = VEND;
			end
		s50: begin 
			st = 2'b01;
			insert_coin = 1;
			money_return = 0;
			dispense = 0;
			if(c50)
				nst = VEND;
			if(d1 || cancel)
				nst = RETURN ;
			end
      VEND: begin 
			st = 2'b10;
			insert_coin = 0;
			money_return = 0;
		  	dispense = 1;
			if(!rst)
				nst = INIT;
			end
		RETURN: begin
			st = 2'b11;
			insert_coin = 0;
			money_return = 1;
		  	dispense = 0;
			if(!rst)
				nst = INIT;
			end
		endcase
	end		

endmodule

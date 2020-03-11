module DataGen(
input             i_clk,
input             i_rst,
input             i_buffon_up,
input             i_buffon_down,
input             i_buffon_left,
input             i_buffon_right,
input      [5:0]  i_color,
output reg [8:0]  o_x,
output reg [7:0]  o_y,
output reg [5:0]  o_data,
output reg        o_done
);

reg done;
reg [8:0]  x_min;
reg [8:0]  x_max;
reg [7:0]  y_min;
reg [7:0]  y_max;
reg [30:0] color_count;


//This always block generates the address for the pixels, ie. the x and y co-ordinates
//x co-ordinate changes from 0 to 399 (width of the screen) and y co-ordinate changes
//from 0 to 224 (height of the screen). Once the complete screen is initialised, done
//signal is asserted.
always @(posedge i_clk)
begin
    if(i_rst)
    begin
        o_x     <= 0;
        o_y     <= 0;
		  o_done  <= 0;
    end
    else
    begin 
    // ADD X AND Y COUNTER CODE HERE
	 o_x <= (o_x+1) % 400; // (num) mod 400 will give remainder 0-399
	 if(o_x == 0)
	 o_y <= (o_y+1) % 225;
	 
	 if((o_x == 399) && (o_y == 224))
	 o_done <= 1;
	 

	end			
end

//This block generates the data for display.
//The x and y maximum and minimum values are used to assign some value to the data
//Data is 6 bits wide, and each 2 bits represents a colour. In the valid range,
//Data is assigned some value and for other co-ordinates it is assigned zeor to keep the screen
//blank
always @(posedge i_clk)
begin
    if(i_rst)
	 begin
	     o_data  <=  6'b111_111;
	 end
	 else
	 begin
	    //if(o_x == o_y)
	    if(o_x > x_min & o_x < x_max & o_y > y_min & o_y < y_max)
          o_data <= i_color[0]?color_count[30:25]:i_color;
       else
          o_data <= 6'b000000;
	 end
end


//This block controls the movement of the rectange based on the user button press.
always @(posedge i_clk)
begin
    if(i_rst)
	 begin
	     x_min  <=  100;
	     x_max  <=  150;
	     y_min  <=  100;
	     y_max  <=  150;
	 end
	 else
	 begin
	 	// ADD UP AND DOWN BUTTON CODE HERE
		// LEFT , RIGHT button  
		  if(i_buffon_left)
		  begin
		      if(x_min >= 1)
				begin
				    x_min <= x_min - 1;
				    x_max <= x_max - 1;
				end	 
		  end
		  if(i_buffon_right)
		  begin
		      if(x_max <= 398)
				begin
				    x_min <= x_min + 1;
				    x_max <= x_max + 1;
				end	 
		  end
		  // UP , DOWN button  
		  if(i_buffon_up)
		  begin
		      if(y_min >= 1)
				begin
				    y_min <= y_min - 1;
				    y_max <= y_max - 1;
				end	 
		  end
		  if(i_buffon_down)
		  begin
		      if(y_max <= 223)
				begin
				    y_min <= y_min + 1;
				    y_max <= y_max + 1;
				end	 
		  end
	 end
end

//color count 
always @(posedge i_clk)
begin

if(i_color[0])
color_count <= color_count+1;
end

endmodule

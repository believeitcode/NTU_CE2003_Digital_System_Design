--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:22 01/30/2020
-- Design Name:   
-- Module Name:   E:/Lab2/dff_modtb.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dff_mod
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dff_modtb IS
END dff_modtb;
 
ARCHITECTURE behavior OF dff_modtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff_mod
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         write_en : IN  std_logic;
         save_data : IN  std_logic;
         show_reg : IN  std_logic;
         d_in : IN  std_logic_vector(7 downto 0);
         d_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal write_en : std_logic := '0';
   signal save_data : std_logic := '0';
   signal show_reg : std_logic := '0';
   signal d_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal d_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff_mod PORT MAP (
          clk => clk,
          rst => rst,
          write_en => write_en,
          save_data => save_data,
          show_reg => show_reg,
          d_in => d_in,
          d_out => d_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

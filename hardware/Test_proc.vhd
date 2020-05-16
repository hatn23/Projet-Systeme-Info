--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:00:07 05/12/2020
-- Design Name:   
-- Module Name:   /home/ise/PSI2/Test_proc.vhd
-- Project Name:  PSI2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processeur
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
use IEEE.std_logic_unsigned.all;
 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_proc IS
END Test_proc;
 
ARCHITECTURE behavior OF Test_proc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(
			INPUT_ADDR : IN std_logic_vector(7 downto 0);
         CLK_PROC : IN  std_logic;
         RST_PROC : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal INPUT_ADDR : std_logic_vector(7 downto 0);
   signal CLK_PROC : std_logic := '0';
   signal RST_PROC : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_PROC_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
			 INPUT_ADDR => INPUT_ADDR,
          CLK_PROC => CLK_PROC,
          RST_PROC => RST_PROC,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_PROC_process :process
   begin
		CLK_PROC <= '0';
		wait for CLK_PROC_period/2;
		CLK_PROC <= '1';
		wait for CLK_PROC_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_PROC_period*10;

      -- insert stimulus here 
		INPUT_ADDR<= x"00";
		wait for CLK_PROC_period;
		
		for i in 0 to 255 loop
			INPUT_ADDR <=  INPUT_ADDR+ x"1";
			wait for CLK_PROC_period;
		end loop;
		
      wait;
   end process;

END;

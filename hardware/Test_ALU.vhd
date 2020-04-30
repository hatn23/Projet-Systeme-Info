--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:44:47 04/29/2020
-- Design Name:   
-- Module Name:   /home/ise/PSI/Test_ALU.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY Test_ALU IS
END Test_ALU;
 
ARCHITECTURE behavior OF Test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         CTRL_ALU : IN  std_logic_vector(2 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal CTRL_ALU : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   signal S : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock> period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          CTRL_ALU => CTRL_ALU,
          N => N,
          O => O,
          Z => Z,
          C => C,
          S => S
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin  
      -- hold reset state for 100 ns.
		A <= x"01";
		B <= x"01";
		CTRL_ALU <= "000";
  
		for i in 0 to 3 loop 
			wait for 100 ns;
			CTRL_ALU <= CTRL_ALU + '1';
		end loop;
		
		A <= x"AA";
		B <= x"55";
		CTRL_ALU <= "000";
  
		for i in 0 to 3 loop 
			wait for 100 ns;
			CTRL_ALU <= CTRL_ALU + '1';
		end loop;
		
		A <= x"FE";
		B <= x"01";
		CTRL_ALU <= "000";
  
		for i in 0 to 3 loop 
			wait for 100 ns;
			CTRL_ALU <= CTRL_ALU + '1';
		end loop;
		
      wait;
		

		
		
   end process;

END;

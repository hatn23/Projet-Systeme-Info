--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:07:53 05/05/2020
-- Design Name:   
-- Module Name:   /home/ise/PSI2/Test_memoire_donnee.vhd
-- Project Name:  PSI2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemoireDonnee
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
 
ENTITY Test_memoire_donnee IS
END Test_memoire_donnee;
 
ARCHITECTURE behavior OF Test_memoire_donnee IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoireDonnee
    PORT(
         ADDR : IN  std_logic_vector(7 downto 0);
         INPUT : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR : std_logic_vector(7 downto 0) := (others => '0');
   signal INPUT : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoireDonnee PORT MAP (
          ADDR => ADDR,
          INPUT => INPUT,
          RW => RW,
          RST => RST,
          CLK => CLK,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

		RST<='0';
		wait for CLK_period*3;
		
		RST<='1';
		--write in @0
		RW<='0';
		INPUT<=x"00";
		ADDR<=x"00";
		wait for CLK_period*3;
		
		--write in @1-@15
		for i in 0 to 14 loop 
			RW<='0';
			INPUT<= INPUT + x"1";
			ADDR<= ADDR + x"1"; 
			wait for CLK_period*3;
		end loop;
			
		--read from R0
		RW<= '1';
		ADDR<= x"00";
		wait for CLK_period*3;
		
		--read from R1-R15
		for i in 0 to 14 loop 
			RW<= '1';
			ADDR<= ADDR + '1';
			wait for CLK_period*3;
		end loop;
		
      wait;
   end process;

END;

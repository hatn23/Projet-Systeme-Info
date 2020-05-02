--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:42:28 04/30/2020
-- Design Name:   
-- Module Name:   /home/ise/PSI/Test_banc_registre.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BandDeRegistre
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
 
ENTITY Test_banc_registre IS
END Test_banc_registre;
 
ARCHITECTURE behavior OF Test_banc_registre IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BandDeRegistre
    PORT(
         Addr_A : IN  std_logic_vector(3 downto 0);
         Addr_B : IN  std_logic_vector(3 downto 0);
         Addr_W : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Addr_A : std_logic_vector(3 downto 0) := (others => '0');
   signal Addr_B : std_logic_vector(3 downto 0) := (others => '0');
   signal Addr_W : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BandDeRegistre PORT MAP (
          Addr_A => Addr_A,
          Addr_B => Addr_B,
          Addr_W => Addr_W,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
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
		RSt<='0';
		wait for CLK_period*3;
		
		RSt<='1';
		--write in R0
		DATA<=x"00";
		ADDR_W<="0000";
		wait for CLK_period*3;
		
		--write in R1-R15
		for i in 0 to 14 loop 
			DATA<= DATA + '1';
			ADDR_W<= ADDR_W +'1';
			W<= '1'; 
			wait for CLK_period*3;
		end loop;
			
		--read from R0-R1
		W<= '0';
		ADDR_A<= "0000";
		ADDR_B<= "0001";
		wait for CLK_period*3;
		
		--read from R2-R15
		for i in 0 to 7 loop 
			W<= '0';
			ADDR_A<= ADDR_A + x"2";
			ADDR_B<= ADDR_B + x"2";
			wait for CLK_period*3;
		end loop;
		
      wait;
   end process;

END;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:08 05/04/2020 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
	 Generic (num : NATURAL := 0); -- nb de MUX
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
	S <= 	B when (num = 1 and OP = x"06") else -- DI/EX AFC 111
			B when (num = 1 and OP = x"07") else -- DI/EX LOAD 100
			B when (num = 1 and OP = x"05") else -- DI/EX COP 101
			B when (num = 1 and OP = x"08") else -- DI/EX STORE 110
			A when (num = 2 and OP = x"01") else -- EX/Mem ADD 001
			A when (num = 2 and OP = x"03")	else -- EX/Mem SUB 011
			A when (num = 2 and OP = x"02")	else -- EX/Mem MUL 010
			A when (num = 3 and OP = x"07") else -- Mem/RE LOAD 100
			B when (num = 4 and OP = x"08") else -- sortie EX/Mem STORE 110
			B;
			

end Behavioral;


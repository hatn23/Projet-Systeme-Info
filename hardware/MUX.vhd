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
           OP : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
	S <= 	B when (num = 1 and OP = x"100") else -- DI/EX AFC 100
			B when (num = 1 and OP = x"101") else -- DI/EX COP 101
			A when (num = 2 and OP = x"000") else -- EX/Mem ADD 000
			A when (num = 2 and OP = x"001")	else -- EX/Mem SUB 001
			A when (num = 2 and OP = x"010")	else -- EX/Mem MUL 010
			B;

end Behavioral;


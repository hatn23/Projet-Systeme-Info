----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:25 05/05/2020 
-- Design Name: 
-- Module Name:    LC - Behavioral 
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

entity LC is
	 Generic ( num : STD_LOGIC:='0');
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           outLC : out  STD_LOGIC);
end LC;

architecture Behavioral of LC is

begin
	--AFC
	outLC <= '1' when (num = '0' AND (OP=X"5" OR OP=X"6" OR OP=X"7" OR OP=X"1" OR OP=X"2" OR OP=X"3"  )) else -- LC registre AFC COP 
			 '1' when (num = '1' AND (OP=X"8")) else --LC MEM LOAD STORE
			 '0';

end Behavioral;


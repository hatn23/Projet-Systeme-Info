----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:48:10 04/30/2020 
-- Design Name: 
-- Module Name:    BandDeRegistre - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BandDeRegistre is
    Port ( Addr_A : in  STD_LOGIC_VECTOR (3 downto 0);
           Addr_B : in  STD_LOGIC_VECTOR (3 downto 0);
           Addr_W : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : in  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end BandDeRegistre;

architecture Behavioral of BandDeRegistre is
signal AUX_A : STD_LOGIC_VECTOR (7 downto 0);
signal AUX_B : STD_LOGIC_VECTOR (7 downto 0);
begin
process
begin
	--synchrone
	wait until CLK'event and CLK='1';
		if(RST='0') then 
			AUX_A<=x"00";
			AUX_B<=x"00";
		else 
			if (W='1') then --ecriture
			
			end if;
		
		end if;
end process;

QA<=AUX_A;
QB<=AUX_B;

end Behavioral;


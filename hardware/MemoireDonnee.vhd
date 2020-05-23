----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:58 05/02/2020 
-- Design Name: 
-- Module Name:    MemoireDonnee - Behavioral 
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

entity MemoireDonnee is
    Port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
end MemoireDonnee;

architecture Behavioral of MemoireDonnee is

type table is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
signal donnee: table ;
begin
	process
	begin
		wait until CLK'event and CLK='1';
			if(RST='1') then 
				donnee<=(others => (others => '0'));
			else 
				if (RW='1') then --ecriture
					donnee(to_integer(unsigned(ADDR)))<= INPUT;
				else  --lecture
					OUTPUT<= donnee(to_integer(unsigned(ADDR)));
				end if;
			
			end if;
	end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:48:10 04/30/2020 
-- Design Name: 
-- Module Name:    BandRegistre - Behavioral 
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
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end BandDeRegistre;

architecture Behavioral of BandDeRegistre is
type table is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
signal BR: table ;
begin
	process
	begin
		wait until CLK'event and CLK='1';
			if(RST='1') then 
				BR<=(others => (others => '0'));
			else 
				if (W='1') then --ecriture
					BR(conv_integer(Addr_W))<= DATA;
				end if;
			end if;
	end process;
	QA <= BR(conv_integer(Addr_W))when (W='1' and ADDR_A=ADDR_W)else BR(conv_integer(Addr_A));
	QB <= BR(conv_integer(Addr_B))when (W='1' and ADDR_B=ADDR_W) else BR(conv_integer(Addr_B));
end Behavioral;

---------------------------------------------------------------------------------
-- Engineer: 
-- 
-- Create Date:    11:34:25 04/20/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           CTRL_ALU : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
	signal ALU_Resultat : std_logic_vector (7 downto 0);

begin
	radd <= (b"0"&A) + (b"0"&B);
	rsub <= (b"0"&A) - (b"0"&B);	rmul <= A * B;
	Stmp <= 	radd (7 downto 0) when CTRL_ALU = "000" else
				rsub (7 downto 0) when CTRL_ALU = "001" else				rmul( 7 downto 0) when CTRL_ALU = "010" else
				(others => "00000000");	C <= radd(8);	O <= 1 when rmul(15 downto 8) != x"00" else 0; 
	Z <= 1 when Stmp(7 downto 0) = "00000000" else 0;
	N <= Stmp(7);
	S <= Stmp;
	
end Behavioral;
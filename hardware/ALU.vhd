----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:25 04/20/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;


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
signal resultat_tmp: std_logic_vector (7 downto 0);
begin
	process(A,B,CTRL_ALU)
	begin 
	case(CTRL_ALU)is
	when "000"=> -- Addition
		resultat_tmp<= (b"0"&A)+(b"0"&B);
		ALU_Resultat<= resultat_tmp(7 downto 0);
		C<= reultat_tmp(8);
		if(A(7)=0 and B(7)=0) then
			C<= "1";
		else
			C<="0";	
		end if;
	when "001"=> -- Substraction
		ALU_Resultat<= A-B;
	when "010"=> -- Multiplication
		ALU_Resultat<= std_logic_vector(to_unsigned(to_integer(unsigned(A))*(to_integer(unsigned(B)))));
	when "100"=> -- Division
		ALU_Resultat<= std_logic_vector(to_unsigned(to_integer(unsigned(A))/(to_integer(unsigned(B)))));
	end case;
	
	--flag zero (Z)
	if (resultat_tmp(7 downto 0)="00000000") then
			Z<="1";
		else
			Z<="0";
	end if;
	--flag negative (N)
	if (resultat_tmp(7)="1") then
			Z<="1";
		else
			Z<="0";
	end if;
	end process;
	
	S <= ALU_Resultat;
end Behavioral;


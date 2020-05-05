----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:47 05/05/2020 
-- Design Name: 
-- Module Name:    Processeur - Behavioral 
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

entity Processeur is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end Processeur;

architecture Behavorial of Processeur is
	-- Components declaration
	
	component UAL
		Port (	A : in  STD_LOGIC_VECTOR (7 downto 0);
					B : in  STD_LOGIC_VECTOR (7 downto 0);
					CTRL_ALU : in  STD_LOGIC_VECTOR (2 downto 0);
					N : out  STD_LOGIC;
					O : out  STD_LOGIC;
					Z : out  STD_LOGIC;
					C : out  STD_LOGIC;
					S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component MUX 
		Generic (num : NATURAL := 0); -- nb de MUX
		Port (	A : in  STD_LOGIC_VECTOR (7 downto 0);
					B : in  STD_LOGIC_VECTOR (7 downto 0);
					OP : in  STD_LOGIC_VECTOR (3 downto 0);
					S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component MemoireDonnee
		 Port (	ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
					INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
					RW : in  STD_LOGIC;
					RST : in  STD_LOGIC;
					CLK : in  STD_LOGIC;
					OUTPUT : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component MemoireInstruction
		 Port ( 	ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
					CLK : in  STD_LOGIC;
					OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Pipeline
		 Port ( 	CLK : in  STD_LOGIC;
					inA : in  STD_LOGIC_VECTOR (7 downto 0);
					inB : in  STD_LOGIC_VECTOR (7 downto 0);
					inC : in  STD_LOGIC_VECTOR (7 downto 0);
					inOP : in  STD_LOGIC_VECTOR (3 downto 0);
					outOP : out  STD_LOGIC_VECTOR (3 downto 0);
					outA : out  STD_LOGIC_VECTOR (7 downto 0);
					outB : out  STD_LOGIC_VECTOR (7 downto 0);
					outC : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component LC
		 Port ( 	OP : in  STD_LOGIC_VECTOR (7 downto 0);
					outLC : out  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	

begin


end Behavorial;


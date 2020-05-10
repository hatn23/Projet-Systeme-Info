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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processeur is
    Port ( CLK_PROC : in  STD_LOGIC;
           RST_PROC : in  STD_LOGIC;
			  IP_PROC : in STD_LOGIC_VECTOR(7 downto 0));
end Processeur;

architecture Behavorial of Processeur is
	-- Components declaration
	
	component ALU
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
		 Port ( 	OP : in  STD_LOGIC_VECTOR (3 downto 0);
					outLC : out  STD_LOGIC );
	end component;
	
	component BandDeRegistre
		Port (	Addr_A : in  STD_LOGIC_VECTOR (3 downto 0);
					Addr_B : in  STD_LOGIC_VECTOR (3 downto 0);
					Addr_W : in  STD_LOGIC_VECTOR (3 downto 0);
					W : in  STD_LOGIC;
					DATA : in  STD_LOGIC_VECTOR (7 downto 0);
					RST : in  STD_LOGIC;
					CLK : in  STD_LOGIC;
					QA : out  STD_LOGIC_VECTOR (7 downto 0);
					QB : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal IP : STD_LOGIC_VECTOR (7 downto 0);
	signal OP_DI,OP_EX, OP_MEM, OP_RE:STD_LOGIC_VECTOR(3 downto 0);
	signal A_DI, B_DI, C_DI : STD_LOGIC_VECTOR(7 downto 0);
	signal A_EX, B_EX, C_EX : STD_LOGIC_VECTOR(7 downto 0);
	signal A_MEM, B_MEM, C_MEM : STD_LOGIC_VECTOR(7 downto 0);
	signal A_RE, B_RE, C_RE : STD_LOGIC_VECTOR(7 downto 0);
	signal REG_QA, REG_QB : STD_LOGIC_VECTOR (7 downto 0);
	signal MUX_BdR_OUT: STD_LOGIC_VECTOR(7 downto 0);
	signal INSTR: STD_LOGIC_VECTOR(31 downto 0);
	signal LC_OUT : STD_LOGIC;

begin
	
	Memoire_Instr : MemoireInstruction PORT MAP (
		ADDR => IP_PROC,
		CLK => CLK_PROC,
		OUTPUT => INSTR
	);
	
	LI_DI :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => INSTR(23 downto 16),
			inB => INSTR(15 downto 8),
			inC => INSTR(7 downto 0),
			inOP => INSTR(27 downto 24),
			outOP => OP_DI,
			outA => A_DI,
			outB => B_DI,
			outC => C_DI
	);
	
	DI_EX :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => A_DI,
			inB => MUX_BdR_OUT,
			inC => C_DI,
			inOP => OP_DI,
			outOP => OP_EX,
			outA => A_EX,
			outB => B_EX,
			outC => C_EX
	);
	
	EX_Mem :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => A_EX,
			inB => B_EX,
			inC => C_EX,
			inOP => OP_EX,
			outOP => OP_MEM,
			outA => A_MEM,
			outB => B_MEM,
			outC => C_MEM
	);
	
	Mem_RE :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => A_MEM,
			inB => B_MEM,
			inC => C_MEM,
			inOP =>  OP_MEM,
			outOP => OP_RE,
			outA => A_RE,
			outB => B_RE,
			outC => C_RE
	);
	
	LOG_C : LC PORT MAP (
			OP => OP_RE,
			outLC  => LC_OUT
	);
	
	BdR : BandDeRegistre PORT MAP (
			Addr_A => x"0",
			Addr_B => x"0",
			Addr_W => A_RE(3 downto 0),
			W => LC_OUT,
			DATA => B_RE,
			RST => RST_PROC,
			CLK=> CLK_PROC,
			QA => REG_QA,
			QB => REG_QB
	);	
	
	MUX_BdR : MUX
	GENERIC MAP(1)
	PORT MAP (
			A => B_DI,
			B => REG_QA,
			OP => OP_DI,
			S => MUX_BdR_OUT
	);
		

end Behavorial;


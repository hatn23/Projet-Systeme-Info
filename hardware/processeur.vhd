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
			  INPUT_ADDR: in STD_LOGIC_VECTOR (7 downto 0)
			  --QA: out STD_LOGIC_VECTOR (7 downto 0);
			  --QB: out STD_LOGIC_VECTOR (7 downto 0)
			  );
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
					OP : in  STD_LOGIC_VECTOR (7 downto 0);
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
					inOP : in  STD_LOGIC_VECTOR (7 downto 0);
					outOP : out  STD_LOGIC_VECTOR (7 downto 0);
					outA : out  STD_LOGIC_VECTOR (7 downto 0);
					outB : out  STD_LOGIC_VECTOR (7 downto 0);
					outC : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component LC 
		 Generic ( num : STD_LOGIC := '0'); -- nb LC
		 Port ( 	OP : in  STD_LOGIC_VECTOR (7 downto 0);
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
	
	----------------- SIGNAL --------------------
	--Pipeline
	type PL is record
		OP: STD_LOGIC_VECTOR(7 downto 0);
		A: STD_LOGIC_VECTOR(7 downto 0);
		B: STD_LOGIC_VECTOR(7 downto 0);
		C: STD_LOGIC_VECTOR(7 downto 0);
	end record;
	signal LI_DI_DI_EX: PL;
	signal DI_EX_EX_MEM: PL;
	signal EX_MEM_MEM_RE: PL;
	signal MEM_RE_OUT: PL;
	
	--MUX
	signal LI_DI_MUX_DI_EX: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal DI_EX_MUX_EX_MEM: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal EX_MEM_MUX_MemD_IN: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal MemD_OUT_MUX_MEM_RE: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	-- LC
	signal DI_EX_LC_EX_MEM: STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal EX_MEM_LC_MEM_RE: std_logic;
	signal MEM_RE_LC_OUT: std_logic;
	
	signal lidiR: boolean;
	signal diexW: boolean;
	signal exmemW: boolean;
	signal waiting: boolean;
	
	--MemoireInstruction
	--signal IP : STD_LOGIC_VECTOR (7 downto 0):=x"00";
	signal INSTR : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	--BancDeRegistre
	signal REG_QA, REG_QB : STD_LOGIC_VECTOR (7 downto 0);
	
	--ALU
	signal ALU_CTRL : STD_LOGIC_VECTOR(2 downto 0);
	signal ALU_N, ALU_O, ALU_Z, ALU_C : STD_LOGIC;
	signal ALU_S : STD_LOGIC_VECTOR (7 downto 0);
	
	
	signal MemD_OUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	signal current_line: STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
begin

	--QA<= REG_QA;
	--QB<= REG_QB;
	
		
	Memoire_Instr : MemoireInstruction PORT MAP (
		ADDR => INPUT_ADDR,
		CLK => CLK_PROC,
		OUTPUT => INSTR
	);
	
	LI_DI :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => INSTR(23 downto 16),
			inB => INSTR(15 downto 8),
			inC => INSTR(7 downto 0),
			inOP => INSTR(31 downto 24),
			outOP => LI_DI_DI_EX.OP,
			outA => LI_DI_DI_EX.A,
			outB => LI_DI_DI_EX.B,
			outC => LI_DI_DI_EX.C
	);
	
	DI_EX :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => LI_DI_DI_EX.A,
			inB => LI_DI_MUX_DI_EX,
			inC => REG_QB,
			inOP => LI_DI_DI_EX.OP,
			outOP => DI_EX_EX_MEM.OP,
			outA => DI_EX_EX_MEM.A,
			outB => DI_EX_EX_MEM.B,
			outC => DI_EX_EX_MEM.C
	);
	
	EX_Mem :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => DI_EX_EX_MEM.A,
			inB => DI_EX_MUX_EX_MEM,
			inC => DI_EX_EX_MEM.C,
			inOP => DI_EX_EX_MEM.OP,
			outOP => EX_MEM_MEM_RE.OP,
			outA => EX_MEM_MEM_RE.A,
			outB => EX_MEM_MEM_RE.B,
			outC => EX_MEM_MEM_RE.C
	);
	
	Mem_RE :  Pipeline PORT MAP (
			CLK => CLK_PROC,
			inA => EX_MEM_MEM_RE.A,
			inB => MemD_OUT_MUX_MEM_RE,
			inC => EX_MEM_MEM_RE.C,
			inOP =>  EX_MEM_MEM_RE.OP,
			outOP => MEM_RE_OUT.OP,
			outA => MEM_RE_OUT.A,
			outB => MEM_RE_OUT.B,
			outC => MEM_RE_OUT.C
	);
	
	BdR : BandDeRegistre PORT MAP (
			Addr_A => LI_DI_DI_EX.B(3 downto 0),
			Addr_B => LI_DI_DI_EX.C(3 downto 0),			
			Addr_W => MEM_RE_OUT.A(3 downto 0),
			W => MEM_RE_LC_OUT,
			DATA => MEM_RE_OUT.B,
			RST => RST_PROC,
			CLK=> CLK_PROC,
			QA => REG_QA,
			QB => REG_QB
	);	
	
	ALU_Map : ALU PORT MAP (
			A => DI_EX_EX_MEM.B,
			B => DI_EX_EX_MEM.C,
			CTRL_ALU => DI_EX_LC_EX_MEM,
			N => ALU_N,
			O => ALU_O,
			Z => ALU_Z,
			C => ALU_C,
			S => ALU_S
	);	
	
	MemD : MemoireDonnee PORT MAP (
		ADDR => EX_MEM_MUX_MemD_IN,
		INPUT => EX_MEM_MEM_RE.B,
		RW => EX_MEM_LC_MEM_RE,
		RST => RST_PROC,
		CLK => CLK_PROC,
		OUTPUT => MemD_OUT
	
	);
	
	MUX_BdR : MUX
	GENERIC MAP(1)
	PORT MAP (
			A => LI_DI_DI_EX.B,
			B => REG_QA,
			OP => LI_DI_DI_EX.OP,
			S => LI_DI_MUX_DI_EX
	);
	
	MUX_ALU : MUX
	GENERIC MAP(2)
	PORT MAP (
			A => DI_EX_EX_MEM.B,
			B => ALU_S,
			OP => DI_EX_EX_MEM.OP,
			S => DI_EX_MUX_EX_MEM
	);
	
	MUX_MemD_IN : MUX
	GENERIC MAP(4)
	PORT MAP (
			A => EX_MEM_MEM_RE.A,
			B => EX_MEM_MEM_RE.B,
			OP => EX_MEM_MEM_RE.OP,
			S => EX_MEM_MUX_MemD_IN
	);
	
	MUX_MemD_OUT : MUX
	GENERIC MAP(3)
	PORT MAP (
			A => MemD_OUT,
			B => EX_MEM_MEM_RE.B,
			OP => EX_MEM_MEM_RE.OP,
			S => MemD_OUT_MUX_MEM_RE
	);
	
	
	--LC
	
	DI_EX_LC_EX_MEM <= DI_EX_EX_MEM.OP(2 DOWNTO 0);
	
	LC_MemD : LC
	GENERIC MAP('1')
	PORT MAP (
			OP => EX_MEM_MEM_RE.OP,
			outLC  => EX_MEM_LC_MEM_RE
	);
	
	LC_MEM_RE : LC 
	GENERIC MAP('0')
	PORT MAP (
			OP => MEM_RE_OUT.OP,
			outLC  => MEM_RE_LC_OUT
	);
	

end Behavorial;


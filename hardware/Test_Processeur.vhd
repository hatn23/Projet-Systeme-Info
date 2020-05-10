-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

  ENTITY Test_Processeur IS
  END Test_Processeur;

  ARCHITECTURE behavior OF Test_Processeur IS 

  -- Component Declaration
          COMPONENT Processeur
          PORT(
                  CLK_PROC : IN std_logic;
						RST_PROC : IN std_logic
                  );
          END COMPONENT;

          SIGNAL CLK_PROC :  std_logic := '0';
          SIGNAL RST_PROC :  std_logic := '0';
			 
			 constant CLK_PROC_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: Processeur PORT MAP(
                   CLK_PROC => CLK_PROC,
						RST_PROC => RST_PROC
          );


			CLK_PROC_process : PROCESS
			BEGIN
				CLK_PROC <= '0';
				wait for CLK_PROC_period/2;
				CLK_PROC <= '1';
				wait for CLK_PROC_period/2;
			END PROCESS;
			
			STIMUL_PROC: process
			BEGIN		
				-- hold reset state for 100 ns.
				wait for 100 ns;	

				wait for CLK_PROC_period*10;

				-- insert stimulus here 

				wait;
			END PROCESS ;
  END;

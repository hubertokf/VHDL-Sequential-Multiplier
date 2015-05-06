-- Somador 8_bits --
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY RCA IS
	PORT (	
		CarryIn: in std_logic;
		val1,val2: in std_logic_vector (31 downto 0);
		SomaResult: out std_logic_vector (31 downto 0);
		CarryOut: out std_logic
	);
END RCA ;

ARCHITECTURE strc_RCA OF RCA IS
	signal carry: std_logic_vector (31 downto 1);
	
	COMPONENT Soma1
		port (	
			CarryIn,val1,val2: in std_logic ;
			SomaResult,CarryOut: out std_logic 
		);
	END COMPONENT ;
	
BEGIN	
	--somador--
	Som0: Soma1 PORT MAP ( 
		CarryIn, 
		val1(0), 
		val2(0), 
		SomaResult(0), 
		carry(1)
	);	
	
	SOM: FOR i IN 1 TO 30 GENERATE
		Som1: Soma1 PORT MAP ( 
			carry(i),
			val1(i),
			val2(i),
			SomaResult(i),
			carry(i+1)
		);
	END GENERATE;
	
	Som7: Soma1 PORT MAP (
		carry(31),
		val1(31),
		val2(31),
		SomaResult(31),
		CarryOut
	);
	
END strc_RCA ;
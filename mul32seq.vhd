library ieee;
use ieee.std_logic_1164.all;

entity mul32seq is

	port(
		mr,md		: in	std_logic_vector(31 downto 0);
		clk		: in 	std_logic;
		reset	 	: in	std_logic;
		out1		: out std_logic_vector(63 downto 0)
	);

end entity;

architecture rtl of mul32seq is
	
	signal sigSelReg : std_logic_vector(1 downto 0);
	signal sigOutMux : std_logic_vector(31 downto 0);
	signal sigOutAdd : std_logic_vector(31 downto 0);
	signal sigOutAddCarry : std_logic;
	signal sigOutRegShift : std_logic_vector(63 downto 0);
	
	component SM2 IS
		PORT (
			clock : in std_logic;
			reset : in std_logic;
			selReg : out std_logic_vector(1 downto 0)
		);
	END component;
	
	component RCA IS
		PORT (	
			CarryIn: in std_logic;
			val1,val2: in std_logic_vector (31 downto 0);
			SomaResult: out std_logic_vector (31 downto 0);
			CarryOut: out std_logic
		);
	END component;
	
	component regshifter is
		port(
			pp			: in	std_logic_vector(31 downto 0);
			valIn		: in  std_logic_vector(63 downto 0);
			mr 		: in 	std_logic_vector(31 downto 0);
			carry		: in  std_logic;
			enable	: in  std_logic_vector(1 downto 0);
			clk		: in 	std_logic;
			rst	 	: in	std_logic;
			out1		: out std_logic_vector(63 downto 0)
		);
	end component;
	
	component mux2to1 is
		port ( 
			SEL : in  STD_LOGIC;
			A   : in  STD_LOGIC_VECTOR (31 downto 0);
			X   : out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
begin

	stateMachine : SM2 port map (clk, reset, sigSelReg);
	
	mux : mux2to1 port map (sigOutRegShift(0), md, sigOutMux);
	
	regshifter1 : regshifter port map (sigOutAdd, sigOutRegShift, mr, sigOutAddCarry, sigSelReg, clk, reset, sigOutRegShift);
	
	adder : RCA port map ('0', sigOutMux, sigOutRegShift(63 downto 32), sigOutAdd, sigOutAddCarry);
	
	out1 <= sigOutRegShift;

end rtl;
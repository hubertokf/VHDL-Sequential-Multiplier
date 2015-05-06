-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/27/2015 22:05:39"
                                                            
-- Vhdl Test Bench template for design  :  mul32seq
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mul32seq_vhd_tst IS
END mul32seq_vhd_tst;
ARCHITECTURE mul32seq_arch OF mul32seq_vhd_tst IS
-- constants                                                 
-- signals                                                   
	SIGNAL clk : STD_LOGIC;
	SIGNAL md : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mr : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL out1 : STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL reset : STD_LOGIC;
	
	COMPONENT mul32seq
		PORT (
		clk : IN STD_LOGIC;
		md : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		mr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		out1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		reset : IN STD_LOGIC
		);
	END COMPONENT;
	
BEGIN

	i1 : mul32seq PORT MAP (
		clk => clk,
		md => md,
		mr => mr,
		out1 => out1,
		reset => reset
	);

	reset <= '1',
				'0' after 20 ns;
	
	init : PROCESS                                               
	-- variable declarations                                     
	BEGIN                                                        
		clk <= '1', '0' AFTER 5 ns;
		WAIT FOR 10 ns;                                                      
	END PROCESS init; 

	mr <= "11111111111111111111111111111110";
	md <= "00000000000000000000000000000010";


	
END mul32seq_arch;

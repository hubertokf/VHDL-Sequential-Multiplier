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

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Mon Apr 27 00:33:55 2015

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY SM2 IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        selReg : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END SM2;

ARCHITECTURE BEHAVIOR OF SM2 IS
    TYPE type_fstate IS (s0,s1,s2,s3);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
	 signal counter : std_LOGIC_VECTOR (5 downto 0);
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset)
			variable count : std_LOGIC_VECTOR (5 downto 0);
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= s0;
            selReg <= "00";
				count := "000000";
        ELSE
            CASE fstate IS
                WHEN s0 =>
						  -- armazena o mr no registrador
                    reg_fstate <= s1;
						  selReg <= "01";
                WHEN s1 =>
						  -- mantem o registrador
						  selReg <= "00";					  						  
						  if (count < "100000") then
								count := count + "000001";
								reg_fstate <= s2;
						  else
								reg_fstate <= s1;
								count := count;
						  end if;
						  
                WHEN s2 =>
						  -- pega o pp e poe no reg
						  reg_fstate <= s3;
						  selReg <= "10";
						  count := count;
						  
                WHEN s3 =>
						  -- shifta o registrador e poe o carry
						  selReg <= "11";
                    reg_fstate <= s1;
						  count := count;
						  
                WHEN OTHERS => 
                    selReg <= "00";
						  count := count;
                    report "Reach undefined state";
            END CASE;
        END IF;
		  
		  counter <= count;
    END PROCESS;
END BEHAVIOR;

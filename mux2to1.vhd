library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_VECTOR (31 downto 0));
end mux2to1;

architecture Behavioral of mux2to1 is
begin
    X <= A when (SEL = '1') else "00000000000000000000000000000000";
end Behavioral;
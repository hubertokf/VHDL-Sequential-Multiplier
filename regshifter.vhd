library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regshifter is

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

end entity;

architecture rtl of regshifter is
	signal Temp: std_logic_vector(63 downto 0);
begin
	process(valIn, clk, rst)
	begin

		if rst = '1' then 
			Temp <= "0000000000000000000000000000000000000000000000000000000000000000";
		elsif (clk='1' and clk'event) then
			Temp <= valIn;
			if ( enable = "00" ) then
				Temp <= valIn;
			elsif ( enable = "01" ) then
				Temp(31 downto 0) <= mr;
			elsif ( enable = "10" ) then
				Temp(63 downto 32) <= pp;
			elsif ( enable = "11" ) then
				Temp <= carry & valIn(63 downto 1);
			end if;
		end if;		
	end process;
	out1 <= Temp;
end rtl;
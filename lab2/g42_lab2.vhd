library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL; 

entity g42_MAC is
	Port( x:	in std_logic_vector(?? downto 0);	
			y: in std_logic_vector(?? downto 0);
			N:	in std_logic_vector(9 downto 0);
			clk: in std_logic;
			rst: in std_logic;
			mac: in std_logic_vector(?? downto 0);
			ready: in std_logic);
end g42_MAC;

architecture behavioral of g42_MAC is
	begin
	
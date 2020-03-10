--Code written by Michael Frajman and Shi Tong Li - Group 42

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL; 

entity g42_lab1 is 
	Port(clk: in std_logic; 
		  countbytwo: in std_logic; 
		  rst: in std_logic; 
		  enable: in std_logic; 
		  output: out std_logic_vector(7 downto 0)); 
end g42_lab1; 


Architecture behavioral of g42_lab1 is
	signal countlimit: unsigned(7 downto 0);
	
	begin
	process(clk)
		begin
		if rising_edge(clk) then
			if rst = '1' then countlimit <= "00000000";
			elsif enable = '1' then
				if countbytwo = '1' and countlimit mod 2 = 0 then
					countlimit <= (countlimit +2) mod 256;
				else countlimit <= (countlimit +1) mod 256;
				end if;
			
			end if;
		end if;
		
	end process;
	output <= std_logic_vector(countlimit);
end behavioral;
			
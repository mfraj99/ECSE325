library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 

entity g42_MAC is
	Port( x:	in std_logic_vector(?? downto 0);	--the first digit to multiply from the x file
			y: in std_logic_vector(?? downto 0);	--the second digit to multiply for the y file
			N:	in std_logic_vector(9 downto 0);		--the total number of numbers in the file (1000 = 0b1111101000)
			clk: in std_logic;							--clock signal
			rst: in std_logic;							--reset
			mac: in std_logic_vector(?? downto 0);	--the product
			ready: in std_logic);						--0 when accessing and accumulating from txt file, 1 when ready for another batch
end g42_MAC;

architecture behavioral of g42_MAC is
	--should integers/signed be initialized here? or are operations being done on logic vectors? 
	begin
	process(clk)
		--N <= "0000000000" --not sure if these need to be initialized and if so where to initialize them  
		--mac <="00000000" --however many zeros
		begin
		if rising_edge(clk) then
			if rst = '1' then mac <="00000000" --however many zeros determined necessary for the output by the scripting language
			elsif ready = '0' then
				for I in 0 to 999 loop	--N = 1000, is offset wrong? shoultd it be 0 to 1000?
					mac <= mac + (x(I) * y(I)); --taken from pseudocode but how would this work for accessing from the txt document? 
				end loop;
			end if;
		end if;
	end process;
end behavioral;

--casting is most likely messed up
--why have variable N? doesnt seem like it gets used
				
	
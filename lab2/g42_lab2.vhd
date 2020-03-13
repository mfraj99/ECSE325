library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 

entity g42_lab2 is
	Port( x:	in std_logic_vector(9 downto 0);	--the first digit to multiply from the x file, found to be 10 bits from script
			y: in std_logic_vector(9 downto 0);	--the second digit to multiply for the y file, found to be 10 bits from script
			N:	in std_logic_vector(9 downto 0);		--the total number of numbers in the file (1000 = 0b1111101000)
			clk: in std_logic;							--clock signal
			rst: in std_logic;							--reset
			mac: out std_logic_vector(19 downto 0);	--the product
			ready: out std_logic);						--0 when accessing and accumulating from txt file, 1 when ready for another batch
end g42_lab2;

architecture behavioral of g42_lab2 is
	--should integers/signed be initialized here? or are operations being done on logic vectors? 
	signal temp: signed(19 downto 0);
	begin
	process(rst, clk)
		--N <= "0000000000" --not sure if these need to be initialized and if so where to initialize them  
		--mac <="00000000" --however many zeros
		begin
		if rising_edge(clk) then
			if rst = '1' then temp <="00000000000000000000"; --however many zeros determined necessary for the output by the scripting language
			else 
				ready <='0';
				for I in 1 to 1000 loop	--N = 1000, is offset wrong? shoultd it be 0 to 1000?
				temp <= temp + signed(x) * signed(y); --taken from pseudocode but how would this work for accessing from the txt document? 
				end loop;
			end if;
			ready <= '1';
		end if;
	end process;
	mac <= std_logic_vector(temp);
end behavioral;

--casting is most likely messed up
--why have variable N? doesnt seem like it gets used
				
	
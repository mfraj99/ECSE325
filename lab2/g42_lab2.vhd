library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 

entity g42_lab2 is
	Port( x:	in std_logic_vector(9 downto 0);	--the first digit to multiply from the x file, found to be 10 bits from script
			y: in std_logic_vector(9 downto 0);	--the second digit to multiply for the y file, found to be 10 bits from script
			N: in std_logic_vector(9 downto 0);		--the total number of numbers in the file (1000 = 0b1111101000)
			clk: in std_logic;							--clock signal
			rst: in std_logic;							--reset
			mac: out std_logic_vector(19 downto 0);	--the product
			ready: out std_logic);						--0 when accessing and accumulating from txt file, 1 when ready for another batch
end g42_lab2;

architecture behavioral of g42_lab2 is
	signal temp: signed(19 downto 0);
	signal i : integer :=0;
	signal readyTemp: std_logic := '0';
	begin
	process(clk, rst)
		begin
		if rst = '1' then
			temp <="00000000000000000000";
		elsif rising_edge(clk) then
			temp <= temp + signed(x) * signed(y); --taken from pseudocode
			i <= i+1;
			if(i = 1000) then
				readyTemp <= '1';
			end if;
		end if;
	end process;
	ready <= readyTemp;
	mac <= std_logic_vector(temp);
end behavioral;

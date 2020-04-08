library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- finite inpulse response filtre
entity g42_FIR is
port(	x		:in std_logic_vector(15 downto 0); --input singla
		clk	:in std_logic; --clock
		rst	:in std_logic; --asynchronous active-high reset
		y		:out std_logic_vector(16 downto 0) --output signal
);
end g42_FIR;

architecture a0 of g42_FIR is
type arr is array(24 downto 0) of signed(15 downto 0);
signal temp: signed(31 downto 0);
signal coeff: arr;
signal input: arr;


begin
--values of the coeff 
coeff(0) <= "";
coeff(1) <= "";
coeff(2) <= "";
coeff(3) <= "";
coeff(4) <= "";
coeff(5) <= "";
coeff(6) <= "";
coeff(7) <= "";
coeff(8) <= "";
coeff(9) <= "";
coeff(10) <= "";
coeff(11) <= "";
coeff(12) <= "";
coeff(13) <= "";
coeff(14) <= "";
coeff(15) <= "";
coeff(16) <= "";
coeff(17) <= "";
coeff(18) <= "";
coeff(19) <= "";
coeff(20) <= "";
coeff(21) <= "";
coeff(22) <= "";
coeff(23) <= "";
coeff(24) <= "";


process(clk)
begin
	if rst = '1' then
		input <= (others=>(others=>'0'));
	elsif rising_edge(clk) then
		temp <="00000000000000000000000000000000";
		for i in 0 to 24 loop
			input(25-i) <= input(25-(i+1));
		end loop;
		input(0) <= signed(x);
		
		for i in 1 to 24 loop
			temp <= temp + coeff(25-i)*input(25-i);
		end loop;
	end if;
end process;
y <= std_logic_vector(temp(31 downto 15));
		
end a0;
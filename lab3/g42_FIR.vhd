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
signal temp: signed(31 downto 0);
begin
process(clk)
	if rst = '1' then
		temp <="00000000000000000000000000000000";
	elsif rising_edge(clk) then
		for i in 0 to 24 loop
			temp = temp + signed(coeff) * signed(x
		
end a0;
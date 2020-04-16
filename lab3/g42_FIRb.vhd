library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity g42_FIRb is
port(	x		:in std_logic_vector(15 downto 0); --input singla
		clk	:in std_logic; --clock
		rst	:in std_logic; --asynchronous active-high reset
		y		:out std_logic_vector(16 downto 0) --output signal
);
end g42_FIRb;

architecture a0 of g42_FIRb is
type arr is array(24 downto 0) of signed(15 downto 0);
signal coeff: arr;
type arrtemp is array(24 downto 0) of signed(31 downto 0);
signal arrout: arrtemp;


begin
--values of the coeff 
coeff(0) <= "0000001001110011";
coeff(1) <= "0000000000010001";
coeff(2) <= "1111111111010010";
coeff(3) <= "1111111011011101";
coeff(4) <= "0000001100011010";
coeff(5) <= "1111110110100111";
coeff(6) <= "1111110000001101";
coeff(7) <= "0000110110111101";
coeff(8) <= "1110110001110010";
coeff(9) <= "0000110111111000";
coeff(10) <= "0000001100001000";
coeff(11) <= "1110101000001010";
coeff(12) <= "0001111000110100";
coeff(13) <= "1110101000001010";
coeff(14) <= "0000001100001000";
coeff(15) <= "0000110111111000";
coeff(16) <= "1110110001110010";
coeff(17) <= "0000110110111101";
coeff(18) <= "1111110000001101";
coeff(19) <= "1111110110100111";
coeff(20) <= "0000001100011010";
coeff(21) <= "1111111011011101";
coeff(22) <= "1111111111010010";
coeff(23) <= "0000000000010001";
coeff(24) <= "0000001001110011";



process(clk, rst)
	variable temp: signed(31 downto 0) := (others => '0');
	variable output: signed(16 downto 0) := (others => '0');
begin
	--for reset, reset all values
	if rst = '1' then
		temp := (others => '0');
		output := (others => '0');
		y <= (others => '0');
	--rising clock tick
	elsif rising_edge(clk) then
		output := (others => '0');
		--do multiplication and put in out array
		for i in 0 to 24 loop
			arrout(i) <= coeff(i)*signed(x);
		end loop;
		
		--take the total sum of all the multiplication of coeff and input
		for i in 0 to 24 loop
			temp := arrout(i);
			output := output + temp(31 downto 15);
		end loop;
		--output
		y <= std_logic_vector(output);
	end if;
end process;

		
end a0;
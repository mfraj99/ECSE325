library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lpm;
use lpm.lpm_components.all;

entity g42_complex_square is	--squares a 32 bit complex numbers (X+iY)(X+iY) = X^2+2iXY-Y^2 
port(	i_clk			:	in std_logic; --clock
		i_rstb		:	in std_logic; --asynchronous reset
		i_x			:	in std_logic_vector(31 downto 0); --real portion input 32 bit complex number
		i_y			:	in std_logic_vector(31 downto 0); --imaginary portion input 32 bit complex number
		o_xx, o_yy	:	out std_logic_vector(64 downto 0)); --real(xx) and imaginary(yy) product of x*y, 65 bit
end g42_complex_square;




architecture rtl of g42_complex_square is

--lpm multiplier component
component LPM_MULT
generic( LPM_WIDTHA				:	natural;
			LPM_WIDTHB				:	natural;
			LPM_WIDTHP				:	natural;
			LPM_REPRESENTATION	:	string := "SIGNED";
			LPM_PIPELINE			:	natural := 0;
			LPM_TYPE					:	string := L_MULT;
			LPM_HINT					:	string := "UNUSED");
port(	DATAA	:	in std_logic_vector(LPM_WIDTHA-1 downto 0);
		DATAB	:	in std_logic_vector(LPM_WIDTHB-1 downto 0);
		ACLR	:	in std_logic := '0';
		CLOCK	:	in std_logic := '0';
		CLKEN	:	in std_logic := '1';
		RESULT:	out std_logic_vector(LPM_WIDTHP-1 downto 0));
end component;

signal r_x, r_y : signed(31 downto 0); --type cast the real (x) and imaginary (y) values
signal XX, YY, XY : std_logic_vector(63 downto 0); --temp variables for pipelining multiplication

begin
--lpm multiplier instantiation for XX
mult1	:	LPM_MULT	generic map(
	LPM_WIDTHA => 32,
	LPM_WIDTHB => 32,
	LPM_WIDTHP => 64,
	LPM_REPRESENTATION => "SIGNED",
	LPM_PIPELINE => 4 )
port map(DATAA => i_x, DATAB => i_x, CLOCK => i_clk, RESULT => XX);

--lpm multiplier instantiation for YY
mult2	:	LPM_MULT	generic map(
	LPM_WIDTHA => 32,
	LPM_WIDTHB => 32,
	LPM_WIDTHP => 64,
	LPM_REPRESENTATION => "SIGNED",
	LPM_PIPELINE => 4 )
port map(DATAA => i_y, DATAB => i_y, CLOCK => i_clk, RESULT => YY);

--lpm multiplier instantiation for XY
mult3	:	LPM_MULT	generic map(
	LPM_WIDTHA => 32,
	LPM_WIDTHB => 32,
	LPM_WIDTHP => 64,
	LPM_REPRESENTATION => "SIGNED",
	LPM_PIPELINE => 4 )
port map(DATAA => i_x, DATAB => i_y, CLOCK => i_clk, RESULT => XY);


p_mult : process(i_clk, i_rstb)
begin
	if(i_rstb = '0') then --reset when low
		o_xx <= (others => '0');
		o_yy <= (others => '0');
		r_x <= (others => '0');
		r_y <= (others => '0');
	elsif(rising_edge(i_clk)) then
		--r_x <= signed(i_x); --cast
		--r_y <= signed(i_y);
		--XX <= r_x*r_x; --pipeline delay
		--YY <= r_y*r_y;
		--XY <= r_x*r_y;
		o_xx <= std_logic_vector(('0'& signed(XX))-signed(YY)); --calculate the real portion of output X^2-Y^2, '0' concatenates to shift the X^2
		o_yy <= std_logic_vector(XY & '0'); --calculate imaginary portion 2iXY, concatenate '0' to the end to shift, his multiplies by 2
	end if;
end process p_mult;
end rtl;
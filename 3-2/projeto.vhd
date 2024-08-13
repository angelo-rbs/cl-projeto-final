library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity projeto is
	port(
    A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
    sel  : in  STD_LOGIC_VECTOR(2 downto 0);
    display_A   : out  STD_LOGIC_VECTOR(15 downto 0);
    display_B   : out  STD_LOGIC_VECTOR(15 downto 0);
    display_output : out  STD_LOGIC_VECTOR(15 downto 0);
		output: out  STD_LOGIC_VECTOR(15 downto 0);
    carry : out std_logic
		)
end projeto;

architecture behaviour of projeto is
	component ula is
		port(
			A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
			sel  : in  STD_LOGIC_VECTOR(2 downto 0);
			output   : out  STD_LOGIC_VECTOR(15 downto 0);
			carry : out std_logic
			)
	end component

	component hex_to_seg is
		port(
			entry: IN STD_LOGIC_VECTOR(3 downto 0);
			segs: OUT STD_LOGIC_VECTOR(0 to 6)
		)
	end component
begin
	process(A, B, sel)
	seg_a : hex_to_seg port map(
		entry => A,
		segs => display_A,
	);
	seg_b : hex_to_seg port map(
		entry => B,
		segs => display_B,
	);

	ula_impl : ula port map(
		A => A,
		B => B
		sel => sel,
		output => output_final,
		carry => carry,
	)
	seg_out: hex_to_seg port map(
		entry => output_final,
		segs => display_output
	)
	end process;

end architecture;

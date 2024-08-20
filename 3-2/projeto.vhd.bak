library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity projeto is
	port(
	 clk : IN STD_LOGIC;
	 reset: IN STD_LOGIC;
    entrada     : in  STD_LOGIC_VECTOR(15 downto 0);
	 ler_a, ler_b, ler_seletor: in STD_LOGIC;
	 mostrar_resultado: in STD_LOGIC;
    display : out  STD_LOGIC_VECTOR(0 to 27); -- valor atual
	 display_estado : out STD_LOGIC_VECTOR(0 to 6); -- estado atual
    carry : out std_logic
		);
end projeto;


architecture behaviour of projeto is
	component hex_to_seg is
		port(
			entry: IN STD_LOGIC_VECTOR(3 downto 0);
			segs: OUT STD_LOGIC_VECTOR(0 to 6)
		);
	end component;
	
	component ula is 
		port(
		 A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
		sel  : in  STD_LOGIC_VECTOR(2 downto 0);
		output   : out  STD_LOGIC_VECTOR(15 downto 0);
		carry : out std_logic
		);
	end component;

	signal A,B: std_logic_vector(15 downto 0); 
	signal sel: std_logic_vector(2 downto 0);
	signal estado: std_logic_vector(3 downto 0) := "1010";
	signal atual : std_logic_vector(15 downto 0);
	signal output: STD_LOGIC_VECTOR(15 downto 0);


begin
	
	seg_estado: hex_to_seg port map(
		entry => estado,
		segs => display_estado
	);

	seg_a : hex_to_seg port map(
		entry => atual(3 downto 0),
		segs => display(0 to 6)
	);
	seg_b : hex_to_seg port map(
		entry => atual(7 downto 4),
		segs => display(7 to 13)
	);
		seg_c : hex_to_seg port map(
		entry => atual(11 downto 8),
		segs => display(14 to 20)
	);
		seg_d : hex_to_seg port map(
		entry => atual(15 downto 12),
		segs => display(21 to 27)
	);

	ula_impl : ula port map(
		A => A,
		B => B,
		sel => sel,
		output => output,
		carry => carry
	);
	
	
	process(clk) begin	
	if rising_edge(clk) then
		if mostrar_resultado = '0' then
			atual <= output;
		else 
			atual <= entrada;
		end if;

	
		if ler_a = '0' then
					estado <= "1010"; 
					A <= entrada;

			  elsif ler_b = '0' then
					estado <= "1011";
					B <= entrada;
			  elsif ler_seletor = '0' then
					estado <= "0000";
					sel <= entrada(2 downto 0);
			  elsif mostrar_resultado = '0' then
					estado <= "1100";
			  end if;
		 end if;

	end process;
end architecture;

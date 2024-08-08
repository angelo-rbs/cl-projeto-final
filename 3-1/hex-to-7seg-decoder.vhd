library IEEE;
use IEEE.std_logic_1164.all;


ENTITY hex_to_seg_decoder IS
PORT (
	entry: IN STD_LOGIC_VECTOR(0 to 3);
	segs: OUT STD_LOGIC_VECTOR(0 to 6)
	);
END hex_to_seg_decoder;

ARCHITECTURE impl OF hex_to_seg_decoder IS
BEGIN
	PROCESS (entry)
	BEGIN
		CASE entry IS
		when "0000" =>
			segs <= "1111110"; -- 0
		when "0001" =>
			segs <= "0110000"; -- 1
		when "0010" =>
			segs <= "1101101"; -- 2
		when "0011" =>
			segs <= "1111001"; -- 3
		when "0100" =>
			segs <= "0110011"; -- 4
		when "0101" =>
			segs <= "1011011"; -- 5
		when "0110" =>
			segs <= "1011111"; -- 6
		when "0111" =>
			segs <= "1110000"; -- 7
		when "1000" =>
			segs <= "1111111"; -- 8
		when "1001" =>
			segs <= "1111011"; -- 9
		when "1010" =>
			segs <= "1110111"; -- A
		when "1011" =>
			segs <= "0011111"; -- B
		when "1100" =>
			segs <= "1001110"; -- C
		when "1101" =>
			segs <= "0111101"; -- D
		when "1110" =>
			segs <= "1001111"; -- E
		when "1111" =>
			segs <= "1000111"; -- F
		when others => 
			segs <= "00000000"; -- Casos não previstos
	END CASE;
END PROCESS;
END impl;


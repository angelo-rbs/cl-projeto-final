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
			segs <= "1111110";
		when "0001" =>
			segs <= "0110000";
		when "0010" =>
			segs <= "1101101";
		when "0011" =>
			segs <= "1111001";
		when "0100" =>
			segs <= "0110011";
		when "0101" =>
			segs <= "1011011";
		when "0110" =>
			segs <= "1011111";
		when "0111" =>
			segs <= "1110000";
		when "1000" =>
			segs <= "1111111";
		when "1001" =>
			segs <= "1111011";
		when "1010" =>
			segs <= "";
		when "1011" =>
			segs <= "";
		when "1100" =>
			segs <= "";
		when "1101" =>
			segs <= "";
		when "1110" =>
			segs <= "";
		when "1101" =>
			segs <= "";

	END CASE;
END PROCESS;
END impl;


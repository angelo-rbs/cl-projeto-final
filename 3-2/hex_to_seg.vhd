library IEEE;
use IEEE.std_logic_1164.all;

ENTITY hex_to_seg IS
PORT (
    entry: IN STD_LOGIC_VECTOR(3 downto 0);
    segs: OUT STD_LOGIC_VECTOR(0 to 6)
);
END hex_to_seg;

ARCHITECTURE impl OF hex_to_seg IS
BEGIN
    PROCESS (entry)
    BEGIN
        CASE entry IS
            when "0000" => segs <= "0000001"; -- 0 inverted
            when "0001" => segs <= "1001111"; -- 1 inverted
            when "0010" => segs <= "0010010"; -- 2 inverted
            when "0011" => segs <= "0000110"; -- 3 inverted
            when "0100" => segs <= "1001100"; -- 4 inverted
            when "0101" => segs <= "0100100"; -- 5 inverted
            when "0110" => segs <= "0100000"; -- 6 inverted
            when "0111" => segs <= "0001111"; -- 7 inverted
            when "1000" => segs <= "0000000"; -- 8 inverted
            when "1001" => segs <= "0000100"; -- 9 inverted
            when "1010" => segs <= "0001000"; -- A inverted
            when "1011" => segs <= "1100000"; -- b inverted
            when "1100" => segs <= "0110001"; -- C inverted
            when "1101" => segs <= "1000010"; -- d inverted
            when "1110" => segs <= "0110000"; -- E inverted
            when "1111" => segs <= "0111000"; -- F inverted
            when others => segs <= "1111111"; -- Default case inverted
        END CASE;
    END PROCESS;
END impl;

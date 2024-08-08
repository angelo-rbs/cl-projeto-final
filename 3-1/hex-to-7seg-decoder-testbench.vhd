library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hex_to_seg_decoder_tb is
end hex_to_seg_decoder_tb;

architecture behavior of hex_to_seg_decoder_tb is 
    component hex_to_seg_decoder
    port(
         entry : in  STD_LOGIC_VECTOR(3 downto 0);
         segs : out  STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

   signal entry : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

   signal segs : STD_LOGIC_VECTOR(6 downto 0);

begin
   uut: hex_to_seg_decoder port map (
          entry => entry,
          segs => segs
        );

   stim_proc: process
   begin        
      for i in 0 to 15 loop
         entry <= std_logic_vector(to_unsigned(i, 4));
         wait for 10 ns;
         
         -- Print the result
         report "Input: " & integer'image(i) & 
                " (0x" & integer'image(i) & "), " & 
                "Output: " & integer'image(to_integer(unsigned(segs)));
      end loop;

      wait;
   end process;

end;

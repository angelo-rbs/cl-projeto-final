library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ULA is
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
    sel  : in  STD_LOGIC_VECTOR(2 downto 0);
    output   : out  STD_LOGIC_VECTOR(15 downto 0);
    carry : out std_logic
    );
end ULA; 
architecture behavior of ULA is

signal result : std_logic_vector (15 downto 0);
signal tmp: std_logic_vector (8 downto 0);

begin
   process(A,B, sel)
 begin
  case(sel) is
  when "000" => -- Soma
   result <= A + B ; 
  when "001" => -- Subtração
   result <= A - B ;
  when "010" => -- Shift Left
   result <= std_logic_vector(unsigned(A) sll 1);
  when "011" => -- Shift Right
   result <= std_logic_vector(unsigned(A) srl 1);
  when "100" => -- AND
   result <= A and B;
  when "101" => -- OR
   result <= A or B;
  when "110" => -- XOR 
   result <= A xor B;
  when "111" => -- XNOR
   result <= A xnor B;
 end process;
 output <= result;
 tmp <= ('0' & A) + ('0' & B);
 Carryout <= tmp(8);
end behavior;

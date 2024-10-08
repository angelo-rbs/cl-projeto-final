library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity projeto is
	port(
	 clk : IN STD_LOGIC;
	 reset: IN STD_LOGIC;
	 
	 entrada     : in  STD_LOGIC_VECTOR(15 downto 0);
	 
	 display : out  STD_LOGIC_VECTOR(0 to 27); -- valor atual
	 display_estado : out STD_LOGIC_VECTOR(0 to 6); -- estado atual
	 display_reg_atual : out STD_LOGIC_VECTOR(0 to 6);
    
	 set_reg : in std_logic;
	 set_val : in std_logic;
	 get_val : in std_logic;
	 
	 carry : out std_logic
		);
end projeto;


architecture behaviour of projeto is
	component banco is
	    generic (
        NUM : integer := 8;  -- Número de registradores
        TAM_REG : integer := 16  -- Tamanho de cada registrador
		);
		port(
		  clk         : in  std_logic;
        	  reset       : in  std_logic;
	        entrada     : in std_logic_vector(TAM_REG-1 downto 0);
        	  saida       : out std_logic_vector(TAM_REG-1 downto 0); 
			  
			  	 set_reg : in std_logic;
				 set_val : in std_logic;
				 get_val : in std_logic
       );
	end component;

	component hex_to_seg is
		port(
			entry: IN STD_LOGIC_VECTOR(3 downto 0);
			segs: OUT STD_LOGIC_VECTOR(0 to 6)
		);
	end component;


	signal visor_estado : std_logic_vector(3 downto 0) := "1010";
	signal visor_reg : std_logic_vector(3 downto 0);
	signal visor_banco : std_logic_vector(15 downto 0) := "0000000000000000";
	
	signal reg_atual : std_logic_vector(3 downto 0);
	signal saida_banco : std_logic_vector(15 downto 0);

	signal estado_op : std_logic_vector(3 downto 0) := "1010";

begin

	seg_a : hex_to_seg port map(
		entry => visor_banco(3 downto 0),
		segs => display(0 to 6)
	);
	seg_b : hex_to_seg port map(
		entry => visor_banco(7 downto 4),
		segs => display(7 to 13)
	);
	seg_c : hex_to_seg port map(
		entry => visor_banco(11 downto 8),
		segs => display(14 to 20)
	);
	seg_d : hex_to_seg port map(
		entry => visor_banco(15 downto 12),
		segs => display(21 to 27)
	);
	seg_reg : hex_to_seg port map(	
		entry => reg_atual(3 downto 0),
		segs => display_reg_atual(0 to 6)
	);
	seg_estado: hex_to_seg port map(
		entry => estado_op,
		segs => display_estado
	);
	
	banco_impl: banco port map(
		clk => clk,
		reset => reset,
		entrada => entrada,
		saida => saida_banco,

		set_reg => set_reg,
		set_val => set_val,
		get_val => get_val
	);
	
	process(clk) begin	
	if rising_edge(clk) then
                if set_reg = '0' then -- escrita/registrador
						estado_op <= "1010";
						reg_atual <= entrada(3 downto 0);
                elsif set_val = '0' then -- escrita/valor
						estado_op <= "1011";
						visor_banco <= entrada;
                elsif get_val = '0' then -- leitura/valor
						estado_op <= "1100";
						visor_banco <= saida_banco;
                end if;
	end if;
	end process;
end architecture;

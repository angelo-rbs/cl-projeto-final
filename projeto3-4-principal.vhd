library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projeto is
    generic (
        TAM_REG : integer := 16  -- Tamanho de cada registrador
    );
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        entrada     : in std_logic_vector(TAM_REG-1 downto 0);

			display        : out  std_logic_vector(0 to 27); -- valor atual
			display_estado : out std_logic_vector(0 to 6); -- estado atual

			ler_a       : in std_logic;
			ler_b       : in std_logic;
			calcular    : in std_logic
    );
end projeto;

architecture behaviour of projeto is

   component hex_to_seg is 
	port (
			entry: IN std_logic_vector(3 downto 0);
			segs: OUT std_logic_vector(0 to 6)
	);
    end component;

    component banco is 
	generic (
	    NUM : integer := 8;  -- Número de registradores
	    TAM_REG : integer := 16  -- Tamanho de cada registrador
	);
	port (
	        clk         : in  std_logic;
	        reset       : in  std_logic;
	        entrada     : in std_logic_vector(TAM_REG-1 downto 0);
	        saida       : out std_logic_vector(TAM_REG-1 downto 0);
		  
		set_reg    : in  std_logic;
		set_val    : in  std_logic;
		get_val    : in  std_logic

	);
    end component;

    -- estados gerais
    signal visor       : std_logic_vector(15 downto 0) := "0000000000000000";
    signal codigo_estado_em_binario : std_logic_vector(3 downto 0) := "1010"; -- A | B | d = (leitura A, leitura B, resultado divisão)
    signal saida_banco : std_logic_vector(15 downto 0); -- para o qual é maṕeada a saída do banco

	 -- estados da divisao
	 
	 signal quoc : signed(15 downto 0) := to_signed(0, 16);
	 signal dividendo : signed(15 downto 0) := to_signed(0, 16);
	 signal divisor : signed(15 downto 0) := to_signed(0, 16);
	 
    -- estados de entrada
    signal entrada_var   : std_logic_vector(TAM_REG-1 downto 0) := "0000000000000000"; -- a entrada dos switches é mapeada pra cá
    signal entrada_banco   : std_logic_vector(TAM_REG-1 downto 0) := "0000000000000000";
	 
    -- estados de saída
	 signal set_reg_control : std_logic := '0';
	 signal set_val_control : std_logic := '0';
	 signal get_val_control : std_logic := '1';
	 

begin

	seg_a : hex_to_seg port map(
		entry => entrada_var(3 downto 0),
		segs => display(0 to 6)
	);
	seg_b : hex_to_seg port map(
		entry => entrada_var(7 downto 4),
		segs => display(7 to 13)
	);
	seg_c : hex_to_seg port map(
		entry => entrada_var(11 downto 8),
		segs => display(14 to 20)
	);
	seg_d : hex_to_seg port map(
		entry => entrada_var(15 downto 12),
		segs => display(21 to 27)
	);
	seg_estado: hex_to_seg port map(
		entry => codigo_estado_em_binario,
		segs => display_estado
	);
	
	banco_impl: banco 
	port map(
		clk => clk,
		reset => reset,
		entrada => entrada_banco,
		saida => saida_banco,

		set_reg => set_reg_control,
		set_val => set_val_control,
		get_val => get_val_control -- ..................................... verificar
	);

    process(clk, reset) begin

			if reset = '0' then
            
         elsif rising_edge(clk) then
		  
                if ler_a = '0' then
					 
						  codigo_estado_em_binario <= "1010";
                    
						  entrada_banco <= "0000000000000000";
						  
						  set_reg_control <= '0';
--						  wait until rising_edge( clk );
						  set_reg_control <= '1';
--						  wait until rising_edge( clk );
						  set_val_control <= '0';
						  entrada_banco <= entrada;
--						  wait until rising_edge( clk );
						  set_val_control <= '1';
						  
					 elsif ler_b = '0' then 
					 
                    codigo_estado_em_binario <= "1011";
						  
						  entrada_banco <= "0000000000000001";
						  
						  set_reg_control <= '0';
--						  wait until rising_edge( clk );
						  set_reg_control <= '1';
--						  wait until rising_edge( clk );
						  set_val_control <= '0';
						  entrada_banco <= entrada;
--						  wait until rising_edge( clk );
						  set_val_control <= '1';
                
					 elsif calcular = '0' then
                    
						  codigo_estado_em_binario <= "1100";
						  quoc <= to_signed(0, 16);

						  -- pega o dividendo (A)
						  entrada_banco <= "0000000000000000";
						  set_reg_control <= '0';
--						  wait until rising_edge( clk );
						  set_reg_control <= '1';
						  get_val_control <= '0';
--						  wait until rising_edge( clk );
						  dividendo <= signed(saida_banco);
						  get_val_control <= '1';
--						  wait until rising_edge( clk );
						  
						  -- pega o divisor (B)
						  entrada_banco <= "0000000000000001";
						  set_reg_control <= '0';
--						  wait until rising_edge( clk );
						  set_reg_control <= '1';
						  get_val_control <= '0';
--						  wait until rising_edge( clk );
						  divisor <= signed(saida_banco);
						  get_val_control <= '1';
--						  wait until rising_edge( clk );
						  
						  while dividendo - divisor >= divisor loop
						   dividendo <= dividendo - divisor;
							quoc <= quoc + 1;
						  end loop;
						  
						  entrada_var <= std_logic_vector(quoc);
						  
--				        registradores(to_integer(unsigned(reg_selecionado))) <= entrada_var;
                --    saida <= registradores(to_integer(unsigned(reg_selecionado)));
                end if;
         end if;
		  
    end process;
end behaviour;




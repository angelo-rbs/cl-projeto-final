library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.to_integer;
use ieee.numeric_std.unsigned;

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
		  
		ler_reg    : in  std_logic;
		insert_val : in  std_logic;
		set_val    : in  std_logic;
		fetch_val  : in  std_logic

	);
    end component;

    component ula is
	port (
		 A, B     : in  STD_LOGIC_VECTOR(15 downto 0);
		sel  : in  STD_LOGIC_VECTOR(2 downto 0);
		output   : out  STD_LOGIC_VECTOR(15 downto 0);
		carry : out std_logic
	);
    end component;

    -- exemplo de definição de tipo (caso necessário) --
    type lista_registradores is array(0 to NUM-1) of std_logic_vector(TAM_REG-1 downto 0);
    signal registradores : lista_registradores := (others => (others => '0'));
    ---

    -- estados relevantes
    signal visor       : std_logic_vector(15 downto 0) := "0000000000000000"; -- 
    signal codigo_estado_em_binario : std_logic_vector(3 downto 0) := "1010"; -- A | B | d = (leitura A, leitura B, resultado divisão)
    signal saida_banco : std_logic_vector(15 downto 0); -- para o qual é maṕeada a saída do banco

    -- estados de entrada
    signal entrada_var   : std_logic_vector(TAM_REG-1 downto 0); -- a entrada dos switches é mapeada pra cá

    -- estados de saída


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
	
	banco_impl: banco port map(
		clk => clk,
		reset => reset,
		entrada => entrada,
		saida => saida_banco,

		set_reg => set_reg,
		set_val => set_val,
		get_val => get_val
	);

    process(clk, reset) begin
        if reset = '0' then
            registradores <= (others => (others => '0'));
        elsif rising_edge(clk) then
                entrada_var <= entrada;
		  
                if ler_reg = '0' then
                    reg_selecionado <= entrada(3 downto 0); 
                elsif set_val = '0' then 
                    entrada_var <= entrada;
                elsif insert_val = '0' then
                    registradores(to_integer(unsigned(reg_selecionado))) <= entrada_var;
                elsif fetch_val = '0' then
                    saida <= registradores(to_integer(unsigned(reg_selecionado)));
                end if;
        end if;
    end process;
end behaviour;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity banco_registradores is
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
end banco_registradores;

architecture behaviour of banco_registradores is

    component registrador is 
        port(
            entrada: IN STD_LOGIC_VECTOR(TAM_REG-1 downto 0);
            clk: IN STD_LOGIC;
            reset: IN STD_LOGIC;
            saida: OUT STD_LOGIC_VECTOR(TAM_REG-1 downto 0)
            );
    end component;

    signal entrada_var : STD_LOGIC_VECTOR(TAM_REG-1 downto 0);
    signal reg_selecionado : STD_LOGIC_VECTOR(NUM-1 downto 0);

begin

    reg1 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );
    reg2 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg3 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg4 :  registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg5 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg6 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg7 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    reg8 : registrador
     port map(
        entrada => entrada_var,
        clk => clk,
        reset => reset,
        saida => saida
    );

    process(clk) begin

        if rising_edge(clk) then
            if reset = '1' then
                entrada_var <= (others => '0');
            else
                entrada_var <= entrada;

                if ler_reg = '0' then
                    reg_selecionado <= entrada; 

                elsif set_val = '0' then 

                    case reg_selecionado is
                        when "" => reg1 

                elsif insert_val = '0' then

                elsif fetch_val = '0' then

                end if;
            end if;
        end if;
    end process;
end behaviour;


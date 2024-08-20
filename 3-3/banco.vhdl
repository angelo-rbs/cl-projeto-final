library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.to_integer;
use ieee.numeric_std.unsigned;

entity banco is
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
end banco;

architecture behaviour of banco is

    type lista_registradores is array(0 to NUM-1) of std_logic_vector(TAM_REG-1 downto 0);
    signal registradores : lista_registradores := (others => (others => '0'));

    signal entrada_var : STD_LOGIC_VECTOR(TAM_REG-1 downto 0); -- valor atual na entrada
    signal reg_selecionado : STD_LOGIC_VECTOR(3 downto 0); -- qual dos 16 registradores está selecionado 


begin

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


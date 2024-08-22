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
		  
	     op : in std_logic; -- escrita/leitura = 0/1 
		  objeto : in std_logic; -- registrador/valor = 0/1

		  reg_atual : out std_logic_vector(3 downto 0)
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
		  
                if op = '0' and objeto = '0' then -- escrita/registrador
                    reg_selecionado <= entrada(3 downto 0); 
		              reg_atual <= reg_selecionado;
                elsif op = '0' and objeto = '1' then -- escrita/valor
                    registradores(to_integer(unsigned(reg_selecionado))) <= entrada_var;
                elsif op = '1' and objeto = '1' then -- leitura/valor
                    saida <= registradores(to_integer(unsigned(reg_selecionado)));
                end if;
        end if;
    end process;
end behaviour;

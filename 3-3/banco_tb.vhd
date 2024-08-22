library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_tb is
end banco_tb;

architecture behavior of banco_tb is
    component banco
        generic (
            NUM : integer := 8;
            TAM_REG : integer := 16
        );
        port (
            clk, reset, set_reg, set_val, get_val : in std_logic;
            entrada : in std_logic_vector(15 downto 0);
            saida : out std_logic_vector(15 downto 0)
        );
    end component;

    signal clk, reset, set_reg, set_val, get_val : std_logic := '1';
    signal entrada, saida : std_logic_vector(15 downto 0);
    constant clk_period : time := 10 ns;
    signal sim_done : boolean := false;  

begin
    uut: banco
        generic map (
            NUM => 8,
            TAM_REG => 16
        )
        port map (
            clk => clk,
            reset => reset,
            set_reg => set_reg,
            set_val => set_val,
            get_val => get_val,
            entrada => entrada,
            saida => saida
        );

    clk_process: process
    begin
        while not sim_done loop  
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait; 
    end process;

stim_proc: process
    begin
    
--     Teste 1 : Set Reg -> Set Val -> Get Val
        -- Initialize all inputs
--         reset <= '1';  -- Active low reset, so start with it inactive
--         set_reg <= '1';
--         set_val <= '1';
--         get_val <= '1';
--         entrada <= (others => '0');

--         wait for clk_period * 2;  -- Wait for a few clock cycles before starting

--         -- Perform reset
--         reset <= '0';
--         wait for clk_period * 2;  -- Hold reset for 2 clock cycles
--         reset <= '1';
--         wait for clk_period * 2;  -- Wait a bit after reset

--         -- Set register 2
--         entrada <= x"0002";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;

--         -- Set value 1234 to register 2
--         entrada <= x"1234";
--         wait for clk_period;
--         set_val <= '0';
--         wait for clk_period;
--         set_val <= '1';
--         wait for clk_period;

--         -- Read value from register 2
--         wait until falling_edge(clk);
--         get_val <= '0';
--         wait for clk_period;
--         get_val <= '1';
--         wait for clk_period;
        
        -- Fim teste 1
        
--         Teste 2 Set_reg A -> Set_val A -> Set_reg B -> Set_val B -> Get_val A -> Get_val B
        
--         reset <= '1';
--         set_reg <= '1';
--         set_val <= '1';
--         get_val <= '1';
--         entrada <= (others => '0');

--         wait for clk_period;

        
--         reset <= '0';
--         wait for clk_period * 2;  -- Hold reset for 2 clock cycles
--         reset <= '1';
--         wait for clk_period * 2;  -- Wait a bit after reset

--         -- Set register 2
--         entrada <= x"0002";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;

--         -- Set value 1234 to register 2
--         entrada <= x"1234";
--         wait for clk_period;
--         set_val <= '0';
--         wait for clk_period;
--         set_val <= '1';
--         wait for clk_period;
        
-- 		-- Set register 7
--         entrada <= x"0007";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;

--         -- Set value FFFF to register 7
--         entrada <= x"FFFF";
--         wait for clk_period;
--         set_val <= '0';
--         wait for clk_period;
--         set_val <= '1';
--         wait for clk_period;

--         -- Set register 2
--         entrada <= x"0002";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;


-- 		-- Read value from register 2
--         wait until falling_edge(clk);
--         get_val <= '0';
--         wait for clk_period;
--         get_val <= '1';
--         wait for clk_period;
        
--         -- Set register 7
--         entrada <= x"0007";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;
        
--         -- Read val register 7
--         wait until falling_edge(clk);
--         get_val <= '0';
--         wait for clk_period;
--         get_val <= '1';
--         wait for clk_period;
        
        -- Fim teste 2
        
--         -- Teste 3 -> Set_reg 2 -> Set_val 0x1234 -> Set_reg 7 -> set_val 0xffff -> reset 1 -> set_reg 2 -> get_val -> set_reg 7 -> get_val
       	
--                 reset <= '1';
--         set_reg <= '1';
--         set_val <= '1';
--         get_val <= '1';
--         entrada <= (others => '0');

--         wait for clk_period;

        
--         reset <= '0';
--         wait for clk_period * 2;  -- Hold reset for 2 clock cycles
--         reset <= '1';
--         wait for clk_period * 2;  -- Wait a bit after reset

--         -- Set register 2
--         entrada <= x"0002";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;

--         -- Set value 1234 to register 2
--         entrada <= x"1234";
--         wait for clk_period;
--         set_val <= '0';
--         wait for clk_period;
--         set_val <= '1';
--         wait for clk_period;
        
-- 		-- Set register 8
--         entrada <= x"0007";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;

--         -- Set value FFFF to register 7
--         entrada <= x"FFFF";
--         wait for clk_period;
--         set_val <= '0';
--         wait for clk_period;
--         set_val <= '1';
--         wait for clk_period;
        
        
--         -- Reset
--         reset <= '0';
--         wait for clk_period;
--         reset <= '1';

--         -- Get register 7
--         entrada <= x"0007";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         get_val <= '0';
--         wait for clk_period;
--         get_val <= '1';
--         wait for clk_period;

        
--         -- Set register 2
--         entrada <= x"0002";
--         wait until falling_edge(clk);  -- Synchronize with clock
--         set_reg <= '0';
--         wait for clk_period;
--         set_reg <= '1';
--         wait for clk_period;
        
--         -- Get resister 2
--         wait until falling_edge(clk);
--         get_val <= '0';
--         wait for clk_period;
--         get_val <= '1';
--         wait for clk_period;
		
--         -- Fim teste 3

-- Teste 4 : set_reg 0x001 -> set_val "0x1234" -> set_reg 0x002 -> set_val "0xFFFF" -> set_reg "0x001" -> get_val -> set_val 0x4321 -> set_reg "0x002" -> get_val -> set_reg "0x001" -> get_val
       	
                reset <= '1';
        set_reg <= '1';
        set_val <= '1';
        get_val <= '1';
        entrada <= (others => '0');

        wait for clk_period;

        
        reset <= '0';
        wait for clk_period * 2;  -- Hold reset for 2 clock cycles
        reset <= '1';
        wait for clk_period * 2;  -- Wait a bit after reset

        -- Set register 1
        entrada <= x"0001";
        wait until falling_edge(clk);  -- Synchronize with clock
        set_reg <= '0';
        wait for clk_period;
        set_reg <= '1';
        wait for clk_period;

        -- Set value 1234 to register 1
        entrada <= x"1234";
        wait for clk_period;
        set_val <= '0';
        wait for clk_period;
        set_val <= '1';
        wait for clk_period;
        
		-- Set register 2
        entrada <= x"0002";
        wait until falling_edge(clk);  -- Synchronize with clock
        set_reg <= '0';
        wait for clk_period;
        set_reg <= '1';
        wait for clk_period;

        -- Set value FFFF to register 2
        entrada <= x"FFFF";
        wait for clk_period;
        set_val <= '0';
        wait for clk_period;
        set_val <= '1';
        wait for clk_period;

        -- Set register 1
        entrada <= x"0001";
        wait until falling_edge(clk);  -- Synchronize with clock
        set_reg <= '0';
        wait for clk_period;
        set_reg <= '1';
        wait for clk_period;


		-- Read value from register 1
        wait until falling_edge(clk);
        get_val <= '0';
        wait for clk_period;
        get_val <= '1';
        wait for clk_period;
        
        -- Set value to register 1
		entrada <= x"4321";
        wait for clk_period;
        set_val <= '0';
        wait for clk_period;
        set_val <= '1';
        wait for clk_period;
        
        -- Set register 2
        entrada <= x"0002";
        wait until falling_edge(clk);  -- Synchronize with clock
        set_reg <= '0';
        wait for clk_period;
        set_reg <= '1';
        wait for clk_period;
        
        -- Read val register 2
        wait until falling_edge(clk);
        get_val <= '0';
        wait for clk_period;
        get_val <= '1';
        wait for clk_period;
        	
            
		-- Set register 1
        entrada <= x"0001";
        wait until falling_edge(clk);  -- Synchronize with clock
        set_reg <= '0';
        wait for clk_period;
        set_reg <= '1';
        wait for clk_period;
        
        -- Read val register 1
        wait until falling_edge(clk);
        get_val <= '0';
        wait for clk_period;
        get_val <= '1';
        wait for clk_period;
        
        
        -- Fim teste 4
		
        wait for 100 ns;
--         -- End of test
        wait for clk_period * 5;  -- Wait a bit before ending
        	sim_done <= true;
        wait;
    end process;
end;

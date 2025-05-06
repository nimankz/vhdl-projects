library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Signal_Generator is
end TB_Signal_Generator;

architecture Behavioral of TB_Signal_Generator is
    -- Component claration
    component Signal_Generator
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            Wave1  : out STD_LOGIC;
            Wave2  : out STD_LOGIC
        );
    end component;

    -- Signals
    signal clk, reset, Wave1, Wave2 : STD_LOGIC;

begin
    -- Instantiate Unit Under Test (UUT)
    UUT: Signal_Generator 
        Port Map ( clk => clk, reset => reset, Wave1 => Wave1, Wave2 => Wave2 );

    -- Clock Process
    process
    begin
        clk <= '0'; wait for 125 ns; -- 4 MHz period (1/4M)
        clk <= '1'; wait for 125 ns;
    end process;

    -- Stimulus Process
    process
    begin
        reset <= '1'; wait for 10 ns;
        reset <= '0'; wait for 1000 ns; -- Allow enough cycles for testing

        wait;
    end process;
end Behavioral;

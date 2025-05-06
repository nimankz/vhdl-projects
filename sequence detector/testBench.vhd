library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Sequence_Detector is
end TB_Sequence_Detector;

architecture Behavioral of TB_Sequence_Detector is
    -- Component declaration for Unit Under Test (UUT)
    component Sequence_Detector
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            data_in  : in  STD_LOGIC_VECTOR(11 downto 0);
            Detected : out STD_LOGIC
        );
    end component;

    -- Signals
    signal clk, reset, Detected : STD_LOGIC;
    signal data_in : STD_LOGIC_VECTOR(11 downto 0);

begin
    -- Instantiate the Sequence Detector
    UUT: Sequence_Detector 
        Port Map (
            clk => clk, 
            reset => reset, 
            data_in => data_in, 
            Detected => Detected
        );

    -- Clock Process
    process
    begin
        clk <= '0'; wait for 5 ns;
        clk <= '1'; wait for 5 ns;
    end process;

    -- Stimulus Process
    process
    begin
        reset <= '1'; wait for 10 ns;
        reset <= '0'; wait for 10 ns;

        -- Test Case 1: No pattern
        data_in <= "110011001100"; wait for 10 ns;

        -- Test Case 2: Pattern appears in the middle
        data_in <= "110101001100"; wait for 10 ns;

        -- Test Case 3: Pattern at the beginning
        data_in <= "010111001100"; wait for 10 ns;

        -- Test Case 4: Pattern at the end
        data_in <= "110011001101"; wait for 10 ns;

        -- Test Case 5: Multiple occurrences
        data_in <= "010101010101"; wait for 10 ns;

        wait;
    end process;
end Behavioral;

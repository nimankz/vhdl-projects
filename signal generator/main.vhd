library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Signal_Generator is
    Port (
        clk    : in  STD_LOGIC;    -- Input clock (4 MHz)
        reset  : in  STD_LOGIC;    -- Reset signal
        Wave1  : out STD_LOGIC;    -- Output waveform 1
        Wave2  : out STD_LOGIC     -- Output waveform 2
    );
end Signal_Generator;

architecture Behavioral of Signal_Generator is
    signal counter : UNSIGNED(2 downto 0) := (others => '0'); -- 3-bit counter (0 to 6)
    signal toggle1, toggle2 : STD_LOGIC := '0'; -- Wave signals

begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
            toggle1 <= '0';
            toggle2 <= '0';
        elsif rising_edge(clk) then
            if counter = "110" then -- When counter reaches 6
                counter <= (others => '0');  -- Reset counter
                toggle1 <= NOT toggle1; -- Toggle wave
                toggle2 <= NOT toggle2; -- Toggle wave
            else
                counter <= counter + 1; -- Increment counter
            end if;
        end if;
    end process;

    Wave1 <= toggle1; -- Assign signal toggle to output
    Wave2 <= toggle2;

end Behavioral;

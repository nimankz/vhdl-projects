library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sequence_Detector is
    Port (
        clk      : in  STD_LOGIC;  -- Clock input
        reset    : in  STD_LOGIC;  -- Reset signal
        data_in  : in  STD_LOGIC_VECTOR(11 downto 0);  -- 12-bit input data
        Detected : out STD_LOGIC   -- Detection output
    );
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Detected <= '0';  -- Reset the detection signal
        elsif rising_edge(clk) then
            -- Check if the pattern "0101" appears anywhere in the input
            if data_in(11 downto 8) = "0101" or
               data_in(10 downto 7) = "0101" or
               data_in(9 downto 6)  = "0101" or
               data_in(8 downto 5)  = "0101" or
               data_in(7 downto 4)  = "0101" or
               data_in(6 downto 3)  = "0101" or
               data_in(5 downto 2)  = "0101" or
               data_in(4 downto 1)  = "0101" or
               data_in(3 downto 0)  = "0101" then
                Detected <= '1';  -- Pattern found
            else
                Detected <= '0';  -- No match
            end if;
        end if;
    end process;
end Behavioral;

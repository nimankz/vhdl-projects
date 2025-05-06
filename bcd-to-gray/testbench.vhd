library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_BCD_to_Gray is
end TB_BCD_to_Gray;

architecture Behavioral of TB_BCD_to_Gray is
    -- Component Declaration for Unit Under Test (UUT)
    component BCD_to_Gray
        Port ( 
            BCD_in  : in STD_LOGIC_VECTOR(3 downto 0);
            Gray_out : out STD_LOGIC_VECTOR(3 downto 0);
            Error    : out STD_LOGIC
        );
    end component;

    -- Signals
    signal BCD_in   : STD_LOGIC_VECTOR(3 downto 0);
    signal Gray_out : STD_LOGIC_VECTOR(3 downto 0);
    signal Error    : STD_LOGIC;

begin
    -- Instantiate UUT
    UUT: BCD_to_Gray 
        Port Map ( 
            BCD_in => BCD_in, 
            Gray_out => Gray_out, 
            Error => Error 
        );

    -- Stimulus Process
    process
    begin
        -- Valid BCD values (0 to 9)
        BCD_in <= "0000"; wait for 10 ns; -- BCD 0 -> Gray 0000
        BCD_in <= "0001"; wait for 10 ns; -- BCD 1 -> Gray 0001
        BCD_in <= "0010"; wait for 10 ns; -- BCD 2 -> Gray 0011
        BCD_in <= "0011"; wait for 10 ns; -- BCD 3 -> Gray 0010
        BCD_in <= "0100"; wait for 10 ns; -- BCD 4 -> Gray 0110
        BCD_in <= "0101"; wait for 10 ns; -- BCD 5 -> Gray 0111
        BCD_in <= "0110"; wait for 10 ns; -- BCD 6 -> Gray 0101
        BCD_in <= "0111"; wait for 10 ns; -- BCD 7 -> Gray 0100
        BCD_in <= "1000"; wait for 10 ns; -- BCD 8 -> Gray 1100
        BCD_in <= "1001"; wait for 10 ns; -- BCD 9 -> Gray 1101

        -- Invalid BCD values (>9)
        BCD_in <= "1010"; wait for 10 ns; -- Invalid -> Error = '1'
        BCD_in <= "1100"; wait for 10 ns; -- Invalid -> Error = '1'
        BCD_in <= "1111"; wait for 10 ns; -- Invalid -> Error = '1'

        wait;
    end process;
end Behavioral;

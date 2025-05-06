
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_to_Gray is
    Port (
        BCD_in      : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit BCD input
        Gray_out    : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Gray code output
        Error       : out STD_LOGIC -- Error signal for invalid BCD input
    );
end BCD_to_Gray;

architecture Behavioral of BCD_to_Gray is
begin
    process(BCD_in)
    begin
        -- Check for valid BCD input (0 to 9)
        if (BCD_in <= "1001") then
            Error <= '0'; -- Valid input
            
            -- Convert BCD to Gray code
            Gray_out(3) <= BCD_in(3);
            Gray_out(2) <= BCD_in(3) XOR BCD_in(2);
            Gray_out(1) <= BCD_in(2) XOR BCD_in(1);
            Gray_out(0) <= BCD_in(1) XOR BCD_in(0);
        else
            Error <= '1'; -- Invalid input
            Gray_out <= (others => '0'); -- Default output
        end if;
    end process;
end Behavioral;

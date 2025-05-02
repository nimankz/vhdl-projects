library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Unit is
    Port (
        a, b : in STD_LOGIC_VECTOR(7 downto 0);
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Logic_Unit;

architecture Behavioral of Logic_Unit is
begin
    process(a, b, opcode)
    begin
        case opcode is
            when "0000" => y <= NOT a;  -- Complement a
            when "0001" => y <= NOT b;  -- Complement b
            when "0010" => y <= a AND b; -- AND
            when "0011" => y <= a OR b;  -- OR
            when "0100" => y <= a NAND b; -- NAND
            when "0101" => y <= a NOR b;  -- NOR
            when "0110" => y <= a XOR b;  -- XOR
            when "0111" => y <= a XNOR b; -- XNOR
            when others => y <= (others => '0'); -- Default case
        end case;
    end process;
end Behavioral;

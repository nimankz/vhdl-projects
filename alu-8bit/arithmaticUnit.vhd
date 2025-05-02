library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Arithmetic_Unit is
    Port (
        a, b : in STD_LOGIC_VECTOR(7 downto 0);
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        cin : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Arithmetic_Unit;

architecture Behavioral of Arithmetic_Unit is
begin
    process(a, b, opcode, cin)
begin
    case opcode is
        when "1010" => y <= std_logic_vector(unsigned(a) + 1);  -- Increment a
        when "1011" => y <= std_logic_vector(unsigned(b) + 1);  -- Increment b
        when "1100" => y <= std_logic_vector(unsigned(a) - 1);  -- Decrement a
        when "1101" => y <= std_logic_vector(unsigned(b) - 1);  -- Decrement b
        when "1110" => y <= std_logic_vector(unsigned(a) + unsigned(b)); -- Add a and b
        when "1111" => y <= std_logic_vector(unsigned(a) + unsigned(b) + to_unsigned(1, a'length)); -- Add a and b with carry
        when others => y <= (others => '0'); -- Default case
    end case;
end process;
end Behavioral;

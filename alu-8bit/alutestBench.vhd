library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ALU is
end TB_ALU;

architecture Behavioral of TB_ALU is
    -- Component declaration for ALU
    component ALU
        Port ( a, b : in STD_LOGIC_VECTOR(7 downto 0);
               opcode : in STD_LOGIC_VECTOR(3 downto 0);
               cin : in STD_LOGIC;
               y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Signals for testing
    signal a, b, y : STD_LOGIC_VECTOR(7 downto 0);
    signal opcode : STD_LOGIC_VECTOR(3 downto 0);
    signal cin : STD_LOGIC;

begin
    -- Instantiate the ALU
    UUT: ALU Port Map (
        a => a, 
        b => b, 
        opcode => opcode, 
        cin => cin, 
        y => y
    );

    -- Stimulus process
    process
    begin
        -- Initialize values
        a <= "00001111";  -- Example value for a
        b <= "00010001";  -- Example value for b
        cin <= '0';       -- Default carry-in

        -- Testing all opcodes based on the project specification
        opcode <= "0000"; wait for 10 ns; -- NOT a
        opcode <= "0001"; wait for 10 ns; -- NOT b
        opcode <= "0010"; wait for 10 ns; -- AND
        opcode <= "0011"; wait for 10 ns; -- OR
        opcode <= "0100"; wait for 10 ns; -- NAND
        opcode <= "0101"; wait for 10 ns; -- NOR
        opcode <= "0110"; wait for 10 ns; -- XOR
        opcode <= "0111"; wait for 10 ns; -- XNOR
        opcode <= "1000"; wait for 10 ns; -- Transfer a
        opcode <= "1001"; wait for 10 ns; -- Transfer b
        opcode <= "1010"; wait for 10 ns; -- Increment a
        opcode <= "1011"; wait for 10 ns; -- Increment b
        opcode <= "1100"; wait for 10 ns; -- Decrement a
        opcode <= "1101"; wait for 10 ns; -- Decrement b
        opcode <= "1110"; wait for 10 ns; -- Add a and b
        opcode <= "1111"; cin <= '1'; wait for 10 ns; -- Add a and b with carry

        wait;
    end process;
end Behavioral;

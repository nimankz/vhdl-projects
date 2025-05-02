library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        a, b : in STD_LOGIC_VECTOR(7 downto 0);
        opcode : in STD_LOGIC_VECTOR(3 downto 0);
        cin : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
    signal logic_out, arithmetic_out : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Instantiate Logic Unit
    component Logic_Unit
        Port ( a, b : in STD_LOGIC_VECTOR(7 downto 0);
               opcode : in STD_LOGIC_VECTOR(3 downto 0);
               y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Instantiate Arithmetic Unit
    component Arithmetic_Unit
        Port ( a, b : in STD_LOGIC_VECTOR(7 downto 0);
               opcode : in STD_LOGIC_VECTOR(3 downto 0);
               cin : in STD_LOGIC;
               y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin
    -- Logic Unit instance
    Logic_Instance: Logic_Unit
        port map ( a => a, b => b, opcode => opcode, y => logic_out );

    -- Arithmetic Unit instance
    Arithmetic_Instance: Arithmetic_Unit
        port map ( a => a, b => b, opcode => opcode, cin => cin, y => arithmetic_out );

    -- Select output based on opcode
    process(opcode, logic_out, arithmetic_out)
    begin
        if opcode <= "0111" then
            y <= logic_out;
        else
            y <= arithmetic_out;
        end if;
    end process;
end Behavioral;

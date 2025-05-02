library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_16bit is
    Port (
        A       : in  STD_LOGIC_VECTOR(15 downto 0);
        B       : in  STD_LOGIC_VECTOR(15 downto 0);
        Abefore: out  STD_LOGIC_VECTOR(15 downto 0);
        Aafter : out  STD_LOGIC_VECTOR(15 downto 0);
        s       : in  STD_LOGIC_VECTOR(3 downto 0);
        ci      : in  STD_LOGIC;
        F       : out STD_LOGIC_VECTOR(15 downto 0);
        co      : out STD_LOGIC  -- Carry out of MSB
    );
end ALU_16bit;

architecture Behavioral of ALU_16bit is

    -- Component declaration
    component ALU
        Port (
            A        : in  STD_LOGIC;
            B        : in  STD_LOGIC;
            Abefore : in  STD_LOGIC;
            Aafter  : in  STD_LOGIC;
            s        : in  STD_LOGIC_VECTOR(3 downto 0);
            ci       : in  STD_LOGIC;
            co       : out STD_LOGIC;
            F        : out STD_LOGIC
        );
    end component;
	 

 signal carry : STD_LOGIC_VECTOR(16 downto 0);  -- Carry chain
 signal ab_before : STD_LOGIC_VECTOR(16 downto 0);
 signal ab_after  : STD_LOGIC_VECTOR(16 downto 0);

begin
    carry(0) <= ci;
	 ab_before <= '0'&a;
	 ab_after <= a&'0';

    GEN_ALU: for i in 0 to 15 generate
        ALU_inst : ALU
            port map (
                A        => A(i),
                B        => B(i),
                Abefore => ab_before(i),
                Aafter  => ab_after(i+1),
                s        => s,
                ci       => carry(i),
                co       => carry(i+1),
                F        => F(i)
            );
    end generate;

    co <= carry(16);  -- Final carry out

end Behavioral;
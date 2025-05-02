-- General Register Component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register is
  generic (WIDTH : integer := 16); -- Width of the register
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    load  : in  std_logic; -- Load control signal
    data_in  : in  std_logic_vector(WIDTH-1 downto 0);
    data_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end register;

architecture Behavioral of register is
  signal reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
  process(clk, reset)
  begin
    if reset = '1' then
      reg <= (others => '0');
    elsif rising_edge(clk) then
      if load = '1' then
        reg <= data_in;
      end if;
    end if;
  end process;

  data_out <= reg;
end Behavioral;

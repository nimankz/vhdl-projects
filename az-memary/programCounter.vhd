-- PC Register with Increment
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc_register is
  generic (WIDTH : integer := 12);
  port (
    clk      : in  std_logic;
    reset    : in  std_logic;
    load     : in  std_logic;
    inc      : in  std_logic; -- Increment control signal
    data_in  : in  std_logic_vector(WIDTH-1 downto 0);
    data_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end pc_register;

architecture Behavioral of pc_register is
  signal reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
  process(clk, reset)
  begin
    if reset = '1' then
      reg <= (others => '0');
    elsif rising_edge(clk) then
      if inc = '1' then
        reg <= std_logic_vector(unsigned(reg) + 1);
      elsif load = '1' then
        reg <= data_in;
      end if;
    end if;
  end process;

  data_out <= reg;
end Behavioral;

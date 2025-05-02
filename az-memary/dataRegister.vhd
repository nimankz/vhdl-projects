-- DR Register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
component register is
  generic (WIDTH : integer := 16);
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    load  : in  std_logic;
    data_in  : in  std_logic_vector(WIDTH-1 downto 0);
    data_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end component;

signal dr_out : std_logic_vector(15 downto 0);

dr_inst : register
  generic map (WIDTH => 16)
  port map (
    clk      => clk,
    reset    => reset,
    load     => load_dr,
    data_in  => dr_in,
    data_out => dr_out
  );

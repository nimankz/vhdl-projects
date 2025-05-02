-- AR Register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
signal ar_out : std_logic_vector(11 downto 0);

ar_inst : register
  generic map (WIDTH => 12)
  port map (
    clk      => clk,
    reset    => reset,
    load     => load_ar,
    data_in  => ar_in,
    data_out => ar_out
  );

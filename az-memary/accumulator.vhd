-- AC Register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
signal ac_out : std_logic_vector(15 downto 0);

ac_inst : register
  generic map (WIDTH => 16)
  port map (
    clk      => clk,
    reset    => reset,
    load     => load_ac,
    data_in  => ac_in,
    data_out => ac_out
  );

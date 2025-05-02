-- TR Register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
signal tr_out : std_logic_vector(15 downto 0);

tr_inst : register
  generic map (WIDTH => 16)
  port map (
    clk      => clk,
    reset    => reset,
    load     => load_tr,
    data_in  => tr_in,
    data_out => tr_out
  );

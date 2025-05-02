-- IR Register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
signal ir_out : std_logic_vector(15 downto 0);

ir_inst : register
  generic map (WIDTH => 16)
  port map (
    clk      => clk,
    reset    => reset,
    load     => load_ir,
    data_in  => ir_in,
    data_out => ir_out
  );

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:09:23 04/12/2025 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           ABefore : in  STD_LOGIC;
           AAfter : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (3 downto 0);
           Ci : in  STD_LOGIC;
           Co : out  STD_LOGIC;
           F : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal t1:std_logic_vector(1 downto 0);
signal E:std_logic;
signal temp1, D : std_logic;

begin
t1 <= s(1 downto 0);
E <= (A and B) WHEN t1 ="00" ELSE 
(A or B) WHEN t1 ="01" ELSE
(A xor B) WHEN t1 ="10" ELSE
(not A) WHEN t1 ="11"; 

temp1 <= B WHEN t1 ="00" ELSE 
(not B) WHEN t1 ="01" ELSE
'0' WHEN t1 ="10" ELSE
'1' WHEN t1 ="11";

D <= A xor B xor Ci;
Co <= (A and B) or (A and Ci) or (B and Ci);


end Behavioral;


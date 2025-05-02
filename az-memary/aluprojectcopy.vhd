library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


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
signal t2:std_logic_vector(1 downto 0);
signal E:std_logic;
signal temp1, D : std_logic;

begin
t1 <= s(1 downto 0);
t2 <= s(3 downto 2);

E <= (A and B) WHEN t1 ="00" ELSE 
(A or B) WHEN t1 ="01" ELSE
(A xor B) WHEN t1 ="10" ELSE
(not A) WHEN t1 ="11"; 

temp1 <= B WHEN t1 ="00" ELSE 
(not B) WHEN t1 ="01" ELSE
'0' WHEN t1 ="10" ELSE
'1' WHEN t1 ="11";

D <= A xor temp1 xor Ci;
Co <= (A and temp1) or (A and Ci) or (temp1 and Ci);

F <= (d) WHEN t2 ="00" ELSE 
(E) WHEN t2 ="01" ELSE
(ABefore) WHEN t1 ="10" ELSE
(AAfter) WHEN t1 ="11"; 


end Behavioral;


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity non_zero  is
  port (A: in std_logic_vector(5 downto 0);  N: out std_logic);
end entity non_zero;
architecture Struct of non_zero is
  signal D,E,F,G: std_logic;
begin
  -- component instances
  o1: OR_2  port map (A => A(5), B => A(4), Y => D);
  o2: OR_2  port map (A => A(3), B => A(2), Y => E);
  o3: OR_2  port map (A => A(1), B =>A(0), Y => F);
  o4: OR_2  port map (A => D, B => E, Y => G);
  o5: OR_2  port map (A => F, B => G, Y => N);
 
end Struct;
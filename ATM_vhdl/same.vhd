library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Same  is
  port (A: in std_logic_vector(15 downto 0); S: out std_logic_vector(15 downto 0));
end entity Same;
architecture Struct of Same is
  signal tC, tS, U, V: std_logic;
begin

  o11: OR_2  port map (A => A(11), B =>'0', Y => S(11));
  o10: OR_2  port map (A => A(10), B => '0', Y => S(10));

  o9: OR_2  port map (A => A(9), B => '0', Y => S(9));

  o8: OR_2  port map (A => A(8), B =>'0', Y => S(8));

  o7: OR_2  port map (A => A(7), B => '0', Y => S(7));

  o6: OR_2  port map (A => A(6), B =>'0', Y => S(6));

o5: OR_2  port map (A => A(5), B => '0', Y => S(5));
o4: OR_2  port map (A => A(4), B => '0', Y => S(4));
o3: OR_2  port map (A => A(3), B => '0', Y => S(3));
o2: OR_2  port map (A => A(2), B => '0', Y => S(2));
o1: OR_2  port map (A => A(1), B => '0', Y => S(1));
o0: OR_2  port map (A => A(0), B => '0', Y => S(0));

o12: OR_2  port map (A => A(12), B => '0', Y => S(12));

o13: OR_2  port map (A => A(13), B =>'0', Y => S(13));

o14: OR_2  port map (A => A(14), B => '0', Y => S(14));

o15: OR_2  port map (A => A(15), B => '0', Y => S(15));



end Struct;

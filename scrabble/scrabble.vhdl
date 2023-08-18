library ieee;
use ieee.std_logic_1164.all;

entity scrabble is
port( x: in std_logic_vector(3 downto 0);
		y: out std_logic_vector(0 downto 0));

end scrabble;

architecture a1 of scrabble is
begin
detector: process(x)
begin
if x = "0010" then 
	y <= "1";
elsif x = "0001" then
	y <= "1";
elsif x = "1101" then 
   y <= "1";
elsif x = "1110" then 
   y <= "1";	
else y <= "0";
end if;
end process;
end a1;

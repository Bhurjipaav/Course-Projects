library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
        output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component detector is
    
port( x: in std_logic_vector(3 downto 0);
		y: out std_logic_vector(0 downto 0));

end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: detector 
			port map (
					
					x => input_vector(3 downto 0),
					y => output_vector(0 downto 0));
end DutWrap;
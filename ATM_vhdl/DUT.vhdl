-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(10 downto 0));
end entity;

architecture dut_instance of DUT is
   component atm is
    port (
			Am: in std_logic_vector(7 downto 0);-- Am (read amount) is amount
			
			Op: out std_logic_vector(10 downto 0));-- P(1)P(0)ABC
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   atm_instance: atm
			port map (
			Am(7 downto 0) => input_vector(7 downto 0),
			
			Op(10 downto 0)=> output_vector(10 downto 0));

end dut_instance;


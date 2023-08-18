-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Adder_Subtractor.
library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(9 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component Beh_modelling  is
     port(A, B, sel : in std_logic_vector ;
         	op: out std_logic_vector);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Beh_modelling 
			port map (
					-- order of inputs I0
					A  => input_vector(7 downto 4),
					B  => input_vector(3 downto 0),
					sel  => input_vector(9 downto 8),
					
  					-- order of outputs Y0, Y1, Y2, Y3, Y4
					op => output_vector(7 downto 0));
					
					
					
end DutWrap;
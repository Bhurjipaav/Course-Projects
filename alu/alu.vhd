library ieee;
use ieee.std_logic_1164.all;

entity Beh_modelling is
    generic(
        operand_width : integer:=4;
        sel_line : integer:=2
        );
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
        sel: in std_logic_vector(sel_line-1 downto 0);
        op: out std_logic_vector((operand_width*2)-1 downto 0)
    ) ;
end Beh_modelling;

architecture a1 of Beh_modelling is
    function add(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
				variable sum : std_logic_vector(3 downto 0) := (others => '0');
				variable carry : std_logic_vector(3 downto 0) := (others => '0');
            -- Declare "sum" and "carry" variable
            -- you can use aggregate to initialize the variables & signals as shown below
            --    variable variable_name : std_logic_vector(3 downto 0) := (others => '0');
        begin
            -- write logic for addition
            -- Hint: Use for loop
				Parity: for i in 0 to 3 loop
					sum(i):= A(i) xor B(i) xor carry(0);
					carry(0):= (A(i) and B(i)) xor ((A(i) xor B(i)) and carry(0));
				end loop;
            return carry(0) & sum;
    end add;
 
begin
alu : process( A, B, sel )
begin
   -- complete VHDL code for various outputs of ALU based on select lines
   -- Hint: use if/else statement
	
	if sel = "00" then
		op <= A & B;
	elsif sel = "01" then
		op <= "000" & add(A,B) ;
	elsif sel = "10" then
		op <= "0000" & (A xor B);
	else
		op <= "000" & add(A,A);
	end if;

   --
   -- add function usage :
   --   signal_name <= add(A,B)
   --   variable_name := add(A,B)
   --
   -- concatenate operator usage:
   --    "0000"&A 
end process ; -- alu
end a1 ; -- a1
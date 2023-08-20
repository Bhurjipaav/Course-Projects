--///////////////////////////////////////////////////////////////////////////

-- @ Soumyajit Langal (WEL IITB)
-- The skeleton code for Mid-Semester EE214. 

--///////////////////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;

entity atm is
-- port declaration 

port (
			Am: in std_logic_vector(7 downto 0);-- Am (read amount) is amount
			
			Op: out std_logic_vector(10 downto 0));-- P(1)P(0)ABC
			
end entity atm ;

architecture atm_instance of atm is

component div is
generic(
			N : integer:=8; -- operand width
			NN : integer:=16 -- result width
        );
port (
			Nu: in std_logic_vector(N-1 downto 0);-- Nu (read numerator) is dividend
			D: in std_logic_vector(N-1 downto 0);-- D (read Denominator) is divisor
			RQ: out std_logic_vector(NN-1 downto 0)--upper N bits of RQ will have remainder and lower N bits will have quotient
) ;
end component;

component non_zero is 

port (   
         A: in std_logic_vector(5 downto 0); 
			N: out std_logic);
			
end component ;

component Same is 

  port (A: in std_logic_vector(15 downto 0); S: out std_logic_vector(15 downto 0));
end component ;  

signal R_100,R_50 : std_logic_vector(15 downto 0) ;
signal NZ_1,NZ_100 ,not_NZ_50 ,tc: std_logic ;

-- write code here

begin

-- Write code here(don't worry about generic, just ignore it and do normal port mapping for div)

div_100 : div
          port map(
			Nu => Am(7 downto 0 ),
			D(7) => '0',
			D(6) => '1',
			D(5) => '1',
			D(4) => '0',
			D(3) => '0',
			D(2) => '1',
			D(1) => '0',
			D(0) => '0',
			RQ  => R_100 );
			
div_50 : div
          port map(
			Nu => R_100(15 downto 8),
			D(7) => '0',
			D(6) => '0',
			D(5) => '1',
			D(4) => '1',
			D(3) => '0',
			D(2) => '0',
			D(1) => '1',
			D(0) => '0',
			RQ => R_50 );
			
Nzero_1 : non_zero 
         port map(
			A => R_50(13 downto 8 ),
			N => NZ_1 );
		
Nzero_100: OR_2  
           port map (
           A =>R_100(1), B =>R_100(0), Y => NZ_100);	
		
P_1 : OR_2  
      port map (
      A =>NZ_100, B =>R_50(0), Y =>Op(10));		
	 
not_Nzero_50 : INVERTER
               port map (A => R_50(0), Y => not_NZ_50 );	
					
a1: AND_2 port map
          (A => NZ_1, B => not_NZ_50, Y => tc);


P_0 : OR_2  
      port map (
      A =>NZ_100, B =>tc, Y =>Op(9));	

same0 : Same port map 
   (A=> R_100, S (1 downto 0)=>Op(8 downto 7) );		
	 
	 same1 : Same port map 
   (A=> R_50, S (6)=>Op(6) );	
	
	same2 : Same port map 
   (A=> R_50, S (5 downto 0)=>Op(5 downto 0) );	
			
end atm_instance;

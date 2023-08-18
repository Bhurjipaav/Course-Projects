library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity cov_detect is
    port(   inp:in std_logic_vector(4 downto 0);
            reset,clock:in std_logic;
            outp: out std_logic;
            out_ascii: out std_logic_vector(39 downto 0));
    end cov_detect;
 architecture rch of cov_detect is
 
---------------Define state type here-----------------------------
type state is (init,s1,s2,s3,s4);
---------------Define signals of state type-----------------------
signal y_present,y_next: state:=init;
signal out_sig: std_logic;
begin
clock_proc:process(clock,reset)
begin
    if(reset='1') then
        y_present<=init;
    elsif(clock='1' and clock' event) then
        y_present<=y_next;
    end if;
    
end process;

--/// To display "abcde", the value of out_ascii = x"61_62_63_64_65"
--/// To display "ab", the value of out_ascii    = x"61_62_20_20_20"
--/// ASCII representation for blank space in Hex = x"20"

state_transition_proc:process(inp,y_present)
begin
    case y_present is
        when init=>
            if(unsigned(inp)=3) then    --c
               -- /////assign next state//////
                --/////assign out_ascii value /////// 
					 
					  y_next<=s1;
					out_ascii<=x"63_20_20_20_20";
						  out_sig<='0'; 
				
				  else
                if (out_sig = '1') then
                   -- /////assign out_ascii value ///////
						  out_ascii<=x"63_6f_76_69_64";
                else            
                    --/////assign out_ascii value ///////
						  out_ascii<=x"20_20_20_20_20";
						  
                end if; 
                --/////assign next state//////
					 y_next<=init;
					   out_sig<='0';
            end if;
            
        
        --/////// Fill the rest of the code //////
		  when s1=>
            if(unsigned(inp)=15) then    --c
                --/////assign next state//////
                --/////assign out_ascii value /////// 
					 
					  y_next<=s2;
					out_ascii<=x"63_6f_20_20_20";
					  out_sig<='0';
						 
				  else
				    y_next<=s1;
				    out_ascii<=x"63_20_20_20_20";
					   out_sig<='0';
					
            end if;
           
				when s2=>
            if(unsigned(inp)=22) then    --c
                --/////assign next state//////
                --/////assign out_ascii value /////// 
					 
					  y_next<=s3;
					out_ascii<=x"63_6f_76_20_20";
					out_sig<='0';
						 
				  else
				    y_next<=s2;
				    out_ascii<=x"63_6f_20_20_20";
					 out_sig<='0';
					
          
            end if;
           
				when s3=>
            if(unsigned(inp)=9) then    --c
                --/////assign next state//////
                --/////assign out_ascii value /////// 
					 
					  y_next<=s4;
					out_ascii<=x"63_6f_76_69_20";
					out_sig<='0';
						 
				  else
				    y_next<=s3;
				    out_ascii<=x"63_6f_76_20_20";
					 out_sig<='0';
					
					 

            end if;
           
				when s4=>
            if(unsigned(inp)=4) then    --c
                --/////assign next state//////
                --/////assign out_ascii value /////// 
					 
					  y_next<=init;
					out_ascii<=x"63_6f_76_69_64";
					out_sig<='1';
						 
				  else
				    y_next<=s4;
				    out_ascii<=x"63_6f_76_69_20";
					 out_sig<='0';

                end if; 
                --/////assign next state//////
           
        end case;
end process;

outp <= out_sig;

end rch;


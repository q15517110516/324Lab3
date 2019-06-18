

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity adder8bit is
	port(  a,b : in std_logic_vector(7 downto 0);
	         s : out std_logic_vector(7 downto 0);
		    ci : in std_logic;
		    c7 : out std_logic;       
		  zero : out std_logic;     
	  overflow : out std_logic;      
	  negative : out std_logic);  
end adder8bit;
architecture structure of adder8bit is

component fa
	port(a,b,ci : in std_logic;
		   s,co : out std_logic);
end component;
           
           signal s_temp,   c : std_logic_vector(7 downto 0); 
           signal overflow_temp : std_logic;                
           
           begin
           
               f0:   fa port map( a(0),b(0),ci,s_temp(0),c(0) );     
               
               f1_7: for i in 1 to 7 generate                             
                       fm: fa port map( a(i),b(i),c(i-1),s_temp(i),c(i) ); 
               end generate f1_7;
                   s <=s_temp;
           
           
               c7<=c(7);                                     
                                                        
               zero <= '1' WHEN s_temp="00000000" ELSE      
                       '0';
                       
               overflow_temp <= c(7) xor c(6);
               overflow <= '1' WHEN overflow_temp = '1' ELSE   
                           '0';
               
               negative <= '1' WHEN s_temp(7) = '1' ELSE        
                           '0';    
          
           end structure;

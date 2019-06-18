
LIBRARY IEEE;
use std.textio.all;
use ieee.std_logic_textio.all; 
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DISPLAY IS
  PORT(
       CLK          :IN STD_LOGIC;
       DISP_IN      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       DISPLAY_CTRL    : IN STD_LOGIC
      );
END ENTITY DISPLAY;



ARCHITECTURE BEHAV OF DISPLAY IS


BEGIN



  PROCESS (CLK)
     variable my_line : LINE;
	variable  cnt_o  : std_logic_vector(7 downto 0):=DISP_IN;
	variable value:std_logic_vector(7 downto 0):="1111";
     begin
	   IF(CLK'EVENT AND CLK='0')THEN
		    IF(DISPLAY_CTRL ='1')THEN

      write(my_line, DISP_IN);	
		writeline(output,my_line);
		
		  END IF;
	  END IF	;
     end process;
   
 END ARCHITECTURE BEHAV;


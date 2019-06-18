
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY EXT IS
 PORT(
       IMM      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       IMMEXT        : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
END ENTITY EXT;

ARCHITECTURE BEHAV OF EXT IS 
 BEGIN

          PROCESS( IMM )
             BEGIN
                IF(IMM(3) = '1')THEN  
                  IMMEXT(3 downto 0) <= IMM;
                  IMMEXT(7 downto 4) <= "1111";
               ELSE 
                   IMMEXT(3 downto 0) <= IMM;
                   IMMEXT(7 downto 4) <= "0000";  
               END IF ;                    
          END PROCESS;


 END ARCHITECTURE BEHAV;
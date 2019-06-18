
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CTRL_UNIT IS
  PORT(OPCODE        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       DISP_OPCODE   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       ALUOP         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
       RFWR          : OUT STD_LOGIC;
       WDSEL         : OUT STD_LOGIC;
       DISPLAY_CTRL   : OUT STD_LOGIC

      );
END ENTITY CTRL_UNIT;

ARCHITECTURE BEHAV OF CTRL_UNIT IS
	  
	  
	  
  BEGIN
    
    
              PROCESS(OPCODE,DISP_OPCODE,EN)
              BEGIN
		    IF (EN = '1') THEN
                     -- IF( OPCODE ="00")THEN
                          -- ALUOP <= "00";
                          -- RFWR <= '1';
                          -- WDSEL <= '0';
                          -- DISPLAY_CTRL <='0';
                      -- ELSIF( OPCODE ="01" )  THEN
                          -- ALUOP <= "01";
                          -- RFWR <= '1';
                          -- WDSEL <= '1';
                          -- DISPLAY_CTRL <='0';
                       ELSIF (OPCODE ="10")  THEN 
                           ALUOP <= "10";
                           RFWR <= '1';
                           WDSEL <= '1';
                           DISPLAY_CTRL <='0';
                      ELSE
                          IF (DISP_OPCODE ="111" ) THEN
                             LUOP <= "11";  
                             RFWR <= '0';
                             WDSEL <= '1';
                             DISPLAY_CTRL <='1';
                           END IF;                         
                      END IF;
					   ELSE	
				               ALUOP <= "00";
                          -- RFWR <= '0';
                          -- WDSEL <= '0';
                          -- DISPLAY_CTRL <='0';		
						 
						END IF ;
             END PROCESS;

	
 END ARCHITECTURE BEHAV;



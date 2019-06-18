
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RF IS
  PORT(
       CLK     : IN STD_LOGIC;
       RST_N   : IN  STD_LOGIC;
       RS      : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       RD      : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       RT      : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       RFWR    : IN STD_LOGIC;
       WD      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       RS_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       RT_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       DISP_RS : IN STD_LOGIC_VECTOR(1 DOWNTO 0);  
       DISP_OUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  
      );
END ENTITY RF;

ARCHITECTURE BEHAV OF RF IS

TYPE matrix_index is array (3 downto 0) of std_logic_vector(7 downto 0);
SIGNAL REG     : matrix_index;
BEGIN


 PROCESS(CLK,RST_N)
 BEGIN
    IF( RST_N = '0' ) THEN  
        REG(0) <= "00000000" ;
        REG(1) <= "00000000";
        REG(2) <= "00000000";
        REG(3) <= "00000000";
    ELSIF(CLK'EVENT AND CLK='0')THEN 
          IF(RFWR='1')THEN
             IF(RD = "00") THEN   
                REG(0) <= WD;
             ELSIF (RD = "01") THEN 
                REG(1) <= WD;
             ELSIF (RD = "10") THEN 
                REG(2) <= WD;
             ELSE  
                REG(3) <= WD;
             END IF;           
           END IF;
    END IF;
 END PROCESS;


   RS_DATA <= REG(0) when  RS = "00" else
              REG(1) when  RS = "01" else
              REG(2) when  RS = "10" else
              REG(3) ;

 
   RT_DATA <= REG(0) when  RT = "00" else
              REG(1) when  RT = "01" else
              REG(2) when  RT = "10" else
              REG(3) ;
              
              
         
 DISP_OUT <= REG(0) when  DISP_RS = "00" else
            REG(1) when  DISP_RS = "01" else
            REG(2) when  DISP_RS = "10" else
            REG(3) ;


 END ARCHITECTURE BEHAV;




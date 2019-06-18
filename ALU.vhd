
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
  PORT( 
    aluop    : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    A        : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    B        : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       C        : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
       ZERO     : OUT  STD_LOGIC 
      
            
    
      );
END ENTITY ALU;

ARCHITECTURE BEHAV OF ALU IS


component adder8bit is                          
port(a,b : in std_logic_vector(7 downto 0);
       s : out std_logic_vector(7 downto 0);
      ci : in std_logic;
      c7 : out std_logic;
    zero : out std_logic;   
overflow : out std_logic;
negative : out std_logic);  
end component;


signal a_in : std_logic_vector(7 downto 0);      
signal b_in : std_logic_vector(7 downto 0);    
signal c_in : std_logic;                        


signal result_add8 : std_logic_vector(7 downto 0);     
signal flow_temp, co_flag,overflow,negative : std_logic;              



SIGNAL C_REG  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ALUOP1 :STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN
 
ALUOP1 <= ALUOP;


 a_in <= A;
 b_in <= not B when ALUOP1 ="10"  else           
             B;                                   
     
 c_in <= '1'   when ALUOP1="10"  else    
      '0';                                      
     
     
 f_add: adder8bit port map
 ( a =>a_in,
 b=>b_in,
 s=>result_add8,
 ci=>c_in,
 c7=>co_flag,
 zero=>zero,
 overflow=>overflow,
 negative=>negative);
 
C<= result_add8;

  
PROCESS(ALUOP1)
BEGIN
         IF(ALUOP1 = "01") THEN --01 
             C_REG <= A + B;
         ELSIF (ALUOP1 = "10") THEN --10 
             C_REG <= A - B;
         END IF;           
END PROCESS;


PROCESS( C_REG)
BEGIN
         IF(C_REG = "00000000" )THEN 
            ZERO <= '1';
         ELSE
             ZERO <= '0';
         END IF;           
END PROCESS;



 END ARCHITECTURE BEHAV;

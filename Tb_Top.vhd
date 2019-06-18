library ieee;  
use ieee.std_logic_1164.all;  
  
entity Tb_Top is    
end Tb_Top;  
  
architecture rtl of Tb_Top is  

  component TOP  
    port(  
     CLK_IN        : IN  STD_LOGIC;  
           RST_N     : IN  STD_LOGIC;      
           INSTRUCTION : IN STD_LOGIC_VECTOR(7 downto 0)  
      );  
  end component;  
  
  signal rst_n  :std_logic:='0';  
  signal clk   :std_logic:='0';  
  signal INSTRUCTION   :std_logic_vector(7 downto 0);  

  
  constant clk_period :time :=200 ns;    
  begin  
    instant:TOP port map  
    (  
       CLK_IN   =>  clk,
             RST_N  => rst_n,
             INSTRUCTION => INSTRUCTION
      );  
  clk_gen:process  
  begin      
    wait for clk_period/2;  
    clk<='1';    
    wait for clk_period/2;  
    clk<='0';  
  end process;  
    
  rst_gen:process  
  begin  
    rst_n<='0';  
    wait for 1000 ns;  
    rst_n<='1';  
    wait;  
  end process;  
      
  INSTRUCTION_gen:process  
  begin  
     INSTRUCTION<="00000000";  
     wait for 1100ns;  
     INSTRUCTION<="00000011";  
     wait for 200ns; 
     INSTRUCTION<="00010011";  
     wait for 200ns; 
     INSTRUCTION<="00101011";  
     wait for 200ns; 
     INSTRUCTION<="00110011";  
     wait for 200ns; 
      INSTRUCTION <= "01111100";
      wait for 200ns; 
      INSTRUCTION <= "10111100"; 
      wait for 200ns; 
           INSTRUCTION <= "11100000"; 
      wait for 200ns; 
             INSTRUCTION <= "11101000"; 
      wait for 200ns; 
             INSTRUCTION <= "11110000"; 
      wait for 200ns; 
             INSTRUCTION <= "11111000"; 
      wait for 200ns; 
            INSTRUCTION <= "00000000"; 
   

    wait;  
  end process;  
end rtl;
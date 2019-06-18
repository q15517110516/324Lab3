library ieee;
use ieee.std_logic_1164.all;

entity fa is
port(a,b,ci : in std_logic;
       s,co : out std_logic);
end fa;

architecture b_fa of fa is
begin
  s<=a xor b xor ci;
  co<=((a xor b) and ci) or (a and b);
end b_fa;

library ieee;
use ieee.std_logic_1164.all; 

entity or_gate is 
    port(
        i_Switch1   : in std_logic; 
        i_Switch2   : in std_logic; 
        o_Led1      : out std_logic); 
end or_gate;

architecture rtl of or_gate is 
begin 
    o_LED1 <= i_Switch1 or i_Switch2; 
end rtl; 
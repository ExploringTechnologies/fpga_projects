library ieee;
use ieee.std_logic_1164.all; 

entity and_gate is 
    port(
        i_Switch1   : in std_logic; 
        i_Switch2   : in std_logic; 
        o_Led1      : out std_logic); 
end and_gate;

architecture rtl of and_gate is 
begin 
    o_LED1 <= i_Switch1 and i_Switch2; 
end rtl; 
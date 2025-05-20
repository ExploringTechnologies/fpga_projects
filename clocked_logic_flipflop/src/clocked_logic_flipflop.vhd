-- Example from nandland.com 

library ieee; 
use ieee.std_logic_1164.all ;

entity Clocked_Logic is 
    port (
        i_clk       : in std_logic; 
        i_Switch_1  : in std_logic; 
        o_LED_1     : out std_logic);
end Clocked_Logic; 

architecture rtl of Clocked_Logic is 
    signal r_LED_1      : std_logic := '0'; 
    signal r_Switch_1   : std_logic := '0'; 

begin 
    p_Register : process (i_clk) is 
    begin 
        if rising_edge(i_clk) then 
            r_Switch_1 <= i_Switch_1;      -- Register
            if i_Switch_1 = '0' and r_Switch_1 = '1' then    --Failling edge
                r_LED_1 <= not r_LED_1 ; 
            end if; 
        end if; 
    end process p_Register; 

    o_LED_1 <= r_LED_1; 

end architecture rtl; 




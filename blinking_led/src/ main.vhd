library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_blinker is
    Port ( 
        i_clk     : in  std_logic;     -- 27MHz input clock
        i_reset   : in  std_logic;     -- Reset input
        o_led : out std_logic      -- LED output signal
    );
end led_blinker;

architecture Behavorial of led_blinker is
    -- Constants
        -- CLK_FREQ is a constant of integer type it hold the value of 27000000
    constant CLK_FREQ  :   integer := 27000000;
    
    -- Signals
        -- (others => '0') means every bit from 0 to 24 will be set to '0'
        -- 24 bit can count up to 33 millions
    signal counter      :   unsigned (24 downto 0 )  := (others => '0');   
    signal led_state    :   std_logic := '0';
    
begin

    process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            -- Reset the counter and LED state
            counter <= (others => '0');
            led_state <= '0';
        elsif rising_edge(i_clk) then
            -- Increment the counter
            if counter = CLK_FREQ - 1 then
                -- When we reach the maximum count: meaning we reach 26999999 count 
                counter <= (others => '0');            -- Reset the counter
                led_state <= not led_state;  -- Toggle the LED
            else
                counter <= counter + 1;   -- Otherwise just increment
            end if;
        end if;
    end process;
    
    -- Assign the LED state to the output
    o_led <= led_state;
    
end Behavorial;
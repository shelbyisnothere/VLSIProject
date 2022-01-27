library ieee;
use ieee.std_logic_1164.all;

entity example_tb is
end example_tb;

architecture behaviour of vending is
component vending
port
(
clk : in std_logic;
rst : in std_logic;
dollar_in : in std_logic;
quarter_in : in std_logic;
water_out : out std_logic
); 
end component;


signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal dollar_in : std_logic := '0';
signal quarter_in : std_logic := '0';

signal water_out : std_logic;

constant clk_period : time := 20ns;
begin

uut : vending 
port map (
clk => clk,
rst => rst,
dollar_in => dollar_in,
quarter_in => quarter_in,
water_out => water_out
);

clk_process: process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

stim_proc: process
begin
wait for 20 ns;
rst <= '1';
wait for 20 ns;
rst <= '0';
dollar_in <= '1';
wait for 200 ns;
dollar_in <= '0';
quarter_in <= '1';
wait for 200 ns;
quarter_in <= '0';
wait;



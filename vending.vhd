library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vending is
Port ( clk, rst : IN STD_LOGIC;
dollar_in, quarter_in : IN STD_LOGIC;
water_out: OUT STD_LOGIC);
end vending;

architecture fsm of vending IS
TYPE state IS (st0, st25, st50, st75, st1);
SIGNAL present_state, next_state: STATE;

begin
PROCESS(rst, clk)
BEGIN
IF(rst='1') THEN
present_state <=st0;
ELSIF(clk' EVENT AND clk ='1') THEN
present_state <= next_state;
END IF;
END PROCESS;

PROCESS(present_state, dollar_in, quarter_in)
BEGIN
CASE present_state IS
WHEN st0 =>
water_out <= '0';
IF (quarter_in='1') THEN next_state <= st25;
ELSIF (dollar_in='1') THEN next_state <= st1;
ELSE next_state <=st0;
END IF;
WHEN st25 =>
water_out <= '0';
IF (quarter_in='1') THEN next_state <= st50;
ELSE next_state <=st25;
END IF;
WHEN st50 =>
water_out <= '0';
IF (quarter_in='1') THEN next_state <= st75;
ELSE next_state <=st50;
END IF;
WHEN st75 =>
water_out <= '0';
IF (quarter_in='1') THEN next_state <= st1;
ELSE next_state <=st75;
END IF;
WHEN st1 =>
water_out <= '1';
next_state <= st0;
END CASE;
END PROCESS;

END fsm;
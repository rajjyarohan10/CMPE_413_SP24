-- VHDL Coding Exercise
-- Code a 4 bit 4 to 1 Mux with S0 and S1

library IEEE;
use IEEE.std_logic_1164.ALL;

entity y_generator is
	port (
		B: in std_logic_vector(3 downto 0);
		S0, S1 : in std_logic;
		Y : out std_logic_vector(3 downto 0);
	);
end y_generator;

architecture Structural of y_generator is

begin

	-- Use XOR gates
	y(3) <= B(3) xor (not S1 xor not S0);
	y(2) <= B(2) xor (not S1 xor not S0);
	y(1) <= B(1) xor (not S1 xor not S0);
	y(0) <= B(0) xor (not S1 xor not S0);

end Structural;

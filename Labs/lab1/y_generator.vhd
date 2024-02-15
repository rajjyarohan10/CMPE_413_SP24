--
-- Entity: y_generator
-- Architecture: structural
-- Author: rajjyap1 (Rajjya Rohan Paudyal)
-- Created On: 2/13/2024
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity y_generator is
  port (
    B   : in  std_logic_vector(7 downto 0);  -- 8-bit input
    S0  : in  std_logic;
    S1  : in  std_logic;
    Y   : out std_logic_vector(7 downto 0)  -- 8-bit output
  );
end y_generator;

architecture structural of y_generator is

-- Declarations for the internal components used for the multiplexer
component mux2to1
  port (
    input1   : in  std_logic_vector(7 downto 0);
    input2   : in  std_logic_vector(7 downto 0);
    select   : in  std_logic;
    output   : out std_logic_vector(7 downto 0)
  );
end component;

-- Declarations for the internal signals
signal all_zeros, all_ones : std_logic_vector(7 downto 0) := (others => '0');
signal not_B : std_logic_vector(7 downto 0);
signal temp_Y : std_logic_vector(7 downto 0);

begin

-- Assigning inverted B
not_B <= not B;

-- First level of multiplexing
mux2to1_0: mux2to1 port map (
  input1 => all_zeros,
  input2 => B,
  select => S0,
  output => temp_Y
);

-- Second level of multiplexing
mux2to1_1: mux2to1 port map (
  input1 => not_B,
  input2 => all_ones,
  select => S1,
  output => Y
);

end structural;

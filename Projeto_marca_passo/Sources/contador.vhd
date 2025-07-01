----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: divisor_clk - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador is
    Port (  clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            spa : in STD_LOGIC; 
            spv : in STD_LOGIC;
            leda : out STD_LOGIC_VECTOR (7 downto 0);
            ledv : out STD_LOGIC_VECTOR (7 downto 0));
end contador;

architecture Behavioral of contador is

    signal count_a : unsigned(7 downto 0) := (others => '0');
    signal count_v : unsigned(7 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count_a <= (others => '0');
            count_v <= (others => '0');
        elsif rising_edge(clk) then
            if spa = '1' and spv = '0' then
                count_a <= count_a + 1;
            elsif spv = '1' and spa = '0' then
                count_v <= count_v + 1;
            elsif spa = '1' and spv = '1' then
                count_a <= count_a + 1;
                count_v <= count_v + 1;
            end if;
        end if;
    end process;

    leda <= std_logic_vector(count_a);
    ledv <= std_logic_vector(count_v); 
end Behavioral;

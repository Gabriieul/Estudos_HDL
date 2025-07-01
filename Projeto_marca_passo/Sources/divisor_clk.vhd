----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2021 10:56:12
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

    signal sleda, sledv: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin

    
    counter: process (clk, reset, spa)
        begin
            if reset = '1' then
                sleda <= (others => '0');
                sledv <= (others => '0');
                
            elsif rising_edge(clk) then
                if spa = '1' and spv = '0' then
                    sleda <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(sleda))+1, 8));
                elsif spv = '1' and spa = '0' then
                    sledv <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(sledv))+1, 8));
                elsif spa = '1' and spv = '1' then
                    sledv <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(sledv))+1, 8));
                    sleda <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(sleda))+1, 8));
 
            end if;
            end if;
            
        leda <= sleda;
        ledv <= sledv;
    end process; 
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: simulacao - Behavioral
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

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simulacao is
--  Port ( );
end simulacao;

architecture Behavioral of simulacao is

component main is
    Port ( sa : in STD_LOGIC; 
           sv : in STD_LOGIC; 
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           ledcv : out STD_LOGIC_VECTOR (7 downto 0);
           ledca : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component top_vio is
    Port ( clk : in STD_LOGIC;
           ledca : out STD_LOGIC_VECTOR (7 downto 0);
           ledcv : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal ssa : std_logic;
signal ssv : std_logic;
signal sclk : std_logic:= '0';
signal sreset : std_logic:= '0';
signal sledca : std_logic_vector (7 downto 0);
signal ssledca : std_logic_vector (7 downto 0);
signal sledcv : std_logic_vector(7 downto 0);
signal ssledcv : std_logic_vector(7 downto 0);

begin

uy : top_vio port map (
            clk => sclk,
            ledca => sledca,
            ledcv => sledcv
);

ux: main port map (
            sa => ssa,
            sv => ssv,
            clk => sclk,
            reset => sreset,
            ledca => ssledca,
            ledcv => ssledcv
);


sclk <= not sclk after 5 ns;

ssa <= '1', '0' after 100 ns;
ssv <= '1', '0' after 150 ns;
sreset <= '0', '1' after 900 ns;


end Behavioral;

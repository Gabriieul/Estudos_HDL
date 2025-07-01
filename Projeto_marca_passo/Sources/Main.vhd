----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: main - Behavioral
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
--arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( sa : in STD_LOGIC; 
           sv : in STD_LOGIC; 
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           ledca : out STD_LOGIC_VECTOR (7 downto 0);
           ledcv : out STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is
    
component marcapasso is
    Port(       sa : in STD_LOGIC; 
                sv : in STD_LOGIC; 
                reset : in STD_LOGIC; 
                clk : in STD_LOGIC;
                pa : out STD_LOGIC;
                pv : out STD_LOGIC);
end component;
    
    component contador is
    Port (      clk : in STD_LOGIC; 
                reset : in STD_LOGIC; 
                spa : in STD_LOGIC; 
                spv : in STD_LOGIC;
                leda : out STD_LOGIC_VECTOR (7 downto 0); 
                ledv : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal sspa, sspv: STD_LOGIC;

    
begin

xxy: marcapasso port map(
        sa => sa,
        sv => sv,
        pa => sspa,
        pv => sspv,
        reset => reset,
        clk => clk
    );
      
utt: contador port map (
        spa => sspa,
        spv => sspv, 
        clk => clk,
        reset => reset,
        leda => ledca,
        ledv => ledcv
    );
    

    
end Behavioral;

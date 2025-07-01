----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2021 00:16:53
-- Design Name: 
-- Module Name: top_vio - Behavioral
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

entity top_vio is
    Port ( clk : in STD_LOGIC;
           ledca : out STD_LOGIC_VECTOR (7 downto 0);
           ledcv : out STD_LOGIC_VECTOR (7 downto 0));
end top_vio;

architecture Behavioral of top_vio is

component main is
    Port ( sa : in STD_LOGIC; 
           sv : in STD_LOGIC; 
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           ledcv : out STD_LOGIC_VECTOR (7 downto 0);
           ledca : out STD_LOGIC_VECTOR (7 downto 0));
end component;

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

signal ssa : std_logic;
signal ssv : std_logic;
signal sclk_div : std_logic:= '0';
signal sreset : std_logic;
signal sledca : std_logic_vector (7 downto 0);
signal sledcv : std_logic_vector(7 downto 0);


begin

yux: main port map (
            sa => ssa,
            sv => ssv,
            clk => clk,
            reset => sreset,
            ledca => sledca,
            ledcv => sledcv
);

vio : vio_0
  PORT MAP (
    clk => clk,
    probe_in0 => sledcv,
    probe_in1 => sledca,
    probe_out0 (0) => ssa,
    probe_out1 (0) => ssv,
    probe_out2 (0) => sreset
  );

--divisor_clock : process (clk, sreset)

--variable cnt : integer range 0 to 5000000 := 0;

--begin
    
--    if sreset = '1' then
--        sclk_div <= '0';
--    elsif falling_edge (clk) then
--        cnt := cnt +1;
--        if cnt = 5000000 then
--            sclk_div <= not sclk_div;
--            cnt := 0;
--end if;
--end if;

--end process;

ledca <= sledca;
ledcv <= sledcv;
  
end Behavioral;
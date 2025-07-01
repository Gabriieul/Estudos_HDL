----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2021 14:18:39
-- Design Name: 
-- Module Name: tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity tb is
----  Port ( );
--end tb;

--architecture Behavioral of tb is

--component top_vio is
--    Port ( clk : in STD_LOGIC;
--           ledca : out STD_LOGIC_VECTOR (7 downto 0);
--           ledcv : out STD_LOGIC_VECTOR (7 downto 0));
--end component;

--component main is
--    Port ( sa : in STD_LOGIC; 
--           sv : in STD_LOGIC; 
--           reset : in STD_LOGIC;
--           clk: in STD_LOGIC;
--           ledca : out STD_LOGIC_VECTOR (7 downto 0);
--           ledcv : out STD_LOGIC_VECTOR (7 downto 0));
--end component;

--signal sclk : std_logic:= '0';
--signal sledca : std_logic_vector (7 downto 0);
--signal sledcv : std_logic_vector (7 downto 0);
--signal ssa : std_logic;
--signal ssv : std_logic;
--signal sreset : std_logic:= '0';

--begin

--xa: top_vio port map (
--                        clk => sclk
--);

--qw: main port map (
--                   sa => ssa,
--                   sv => ssv,
--                   reset => sreset,
--                   clk => sclk     
--);

--sclk <= not sclk after 5 ns;
--ssa <= '1', '0' after 100 ns;
--ssv <= '1';

--end Behavioral;

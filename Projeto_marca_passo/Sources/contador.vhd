----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: contador - Behavioral
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

entity marcapasso is
    Port(   sa : in STD_LOGIC; 
            sv : in STD_LOGIC; 
            reset : in STD_LOGIC := '0'; 
            clk : in STD_LOGIC := '0';
            pa : out STD_LOGIC; 
            pv : out STD_LOGIC);
end marcapasso;

architecture Behavioral of marcapasso is

    type tipo_estado is (e0, e1, e2, e3, e4, e5);
    signal estado_atual, proximo_estado: tipo_estado := e0;
    
    signal tA, tV, zA, zV: STD_LOGIC := '0';
    signal change1: STD_LOGIC := '0';
    signal change2: STD_LOGIC := '0';
    signal count_A, count_V: integer := 0;

begin
     
    process (clk, reset)
        begin 
            if reset='1' then
              estado_atual <= e0;
            elsif rising_edge(clk) then
              estado_atual <= proximo_estado;
            end if;
    end process;
    
    reset_atrio: process (tV, tA, clk, reset, change1, change2)
        begin
            
            if rising_edge(clk) then
                if change1='0' then
                    if reset ='1' then
                        count_A <= 0;
                    elsif tA='1' then
                        count_A <= 0;
                    elsif count_A = 8 then
                        change2 <= '1';
                        count_A <= 0;
                        zA <= '1';
                        zV <= '0';
                    else
                        count_A <= count_A+1;
                    end if;
                end if;
        
                if change2 = '1' then
                    if reset ='1' then
                        count_V <= 0;
                    elsif tV='1' then
                        count_V <= 0;
                    elsif count_V = 8 then  
                        change1 <= '0';  
                        count_V <= 0;                   
                        zA <= '0';
                        zV <= '1';
                    else
                        count_V <= count_V+1;
                    end if;
                end if;
            end if;
    end process;
    
    FSM: process (clk, estado_atual, sa, zA, sv, zV)
    begin 
        case estado_atual is
            when e0 =>
                pV <= '0';
                tA <= '1';
                proximo_estado <= e1;
                
            when e1 => 
                tA <= '0';
                if sa = '0' then 
                    if zA = '0' then
                        proximo_estado <= e1;
                    elsif zA = '1' then
                        proximo_estado <= e2;
                    end if;    
                elsif sa = '1' then 
                    proximo_estado <= e3;
                end if;
                
            when e2 =>
                pA <= '1';
                proximo_estado <= e3;
                  
            when e3 =>
                pA <= '0';
                tV <= '1';
                proximo_estado <= e4;
                
            when e4 =>
                tV <= '0';
                if sv = '0' then 
                    if zV = '0' then
                        proximo_estado <= e4;
                    elsif zV = '1' then
                        proximo_estado <= e5;
                    end if;  
                          
                elsif sv = '1' then 
                    proximo_estado <= e0;    
                end if;
                
            when e5 =>            
                pV <= '1';
                proximo_estado <= e0;
                
            when others =>
                proximo_estado <= e0;
        end case;
    end process;
end architecture;

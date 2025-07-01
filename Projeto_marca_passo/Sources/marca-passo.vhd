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
    signal count_A, count_V: integer := 0;
    signal pa_int, pv_int : STD_LOGIC := '0';

begin

    pa <= pa_int;
    pv <= pv_int;
    
    process (clk, reset)
        begin 
            if reset='1' then
              estado_atual <= e0;
            elsif rising_edge(clk) then
              estado_atual <= proximo_estado;
            end if;
    end process;

                
    process(clk, reset)
    begin
        if reset = '1' then
            count_A <= 0;
            zA <= '0';
        elsif rising_edge(clk) then
            if tA = '1' then
                if count_A = 8 then
                    zA <= '1';
                    count_A <= 0;
                else
                    count_A <= count_A + 1;
                    zA <= '0';
                end if;
            else
                count_A <= 0;
                zA <= '0';
            end if;
        end if;
    end process;

    process(clk, reset)
    begin
        if reset = '1' then
            count_V <= 0;
            zV <= '0';
        elsif rising_edge(clk) then
            if tV = '1' then
                if count_V = 8 then
                    zV <= '1';
                    count_V <= 0;
                else
                    count_V <= count_V + 1;
                    zV <= '0';
                end if;
            else
                count_V <= 0;
                zV <= '0';
            end if;
        end if;
    end process;

            
    FSM: process (estado_atual, sa, zA, sv, zV)
    begin 

        pa_int <= '0';
        pv_int <= '0';
        tA <= '0';
        tV <= '0';
        
        case estado_atual is
            when e0 =>
                pv_int <= '0';
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
                pa_int <= '1';
                proximo_estado <= e3;
                  
            when e3 =>
                tV <= '1';
                proximo_estado <= e4;
                
            when e4 =>
                tV <= '1';
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
                pv_int <= '1';
                proximo_estado <= e0;
                
            when others =>
                proximo_estado <= e0;
        end case;
    end process;
end architecture;

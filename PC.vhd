----------------------------------------------------------------------------------
-- Company: 
-- Engineer: LEN QUACH & VERONICA FUENTES
-- 
-- Create Date: 03/23/2021 01:59:48 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    port(
        instruction: in STD_LOGIC_VECTOR(31 downto 0);
        reset, clock : in STD_LOGIC;
        pc_out : out STD_LOGIC_VECTOR(31 downto 0)
    );
end PC;

architecture Behavioral of PC is
    begin
    process(clock)
        begin
           -- updates at positive edge of clock
           if rising_edge(clock) then
               if(reset = '1') then
                   pc_out <= x"00000000";
               else
                   pc_out <= instruction;
               end if;
           end if;
    end process;

end Behavioral;

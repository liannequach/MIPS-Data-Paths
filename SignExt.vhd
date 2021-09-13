----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 02:17:47 PM
-- Design Name: 
-- Module Name: SignExt - Behavioral
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

entity SignExt is
    Port ( 
        instruction : in STD_LOGIC_VECTOR(15 downto 0);
        ext_instr : out STD_LOGIC_VECTOR(31 downto 0)
    );
end SignExt;

architecture Behavioral of SignExt is
begin
    process(instruction)
    begin
        if instruction(15) = '1' then
            ext_instr <= x"1111" & instruction;
        else
            ext_instr <= x"0000" & instruction;
        end if;
    end process;

end Behavioral;

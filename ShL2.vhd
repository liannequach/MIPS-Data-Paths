----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 02:18:20 PM
-- Design Name: 
-- Module Name: ShL2 - Behavioral
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

entity ShL2 is
    Port ( 
        ext_instr : in STD_LOGIC_VECTOR(31 downto 0);
        shift_instr : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ShL2;

architecture Behavioral of ShL2 is
signal shift_l : STD_LOGIC_VECTOR(31 downto 0);

begin
    process(ext_instr)
    begin
        -- [31,30,29,28] [27,26,25,24] 23.....
        -- assign 29 to highest bit & add 2 0's at end of bit string to account for 2 bits removed
        shift_l <= ext_instr(29 downto 0) & "00";
    end process;
    
    shift_instr <= shift_l;

end Behavioral;

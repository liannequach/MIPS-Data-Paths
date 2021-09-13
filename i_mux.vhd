----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 03:02:39 PM
-- Design Name: 
-- Module Name: i_mux - Behavioral
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

entity i_mux is
    Port ( 
        din1, din2 : in STD_LOGIC_VECTOR(4 downto 0);
        sel : in STD_LOGIC;
        dout : out STD_LOGIC_VECTOR(4 downto 0)
    );
end i_mux;

architecture Behavioral of i_mux is
    begin
        process (din1, din2, sel)
            begin
                if sel = '0' then
                    dout <= din1;
                else -- if sel = '1' then
                    dout <= din2;
                end if;
         end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 03:37:07 PM
-- Design Name: 
-- Module Name: Datapath_tb - Behavioral
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
--use STD.ENV.STOP;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Datapath_tb is
--  Port ( );
end Datapath_tb;

architecture Behavioral of Datapath_tb is
    signal reset : STD_LOGIC := '1';
    signal clk : STD_LOGIC := '1';
    signal mem_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal ALU_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    
    CONSTANT period : TIME := 20ns;
    CONSTANT terminate : TIME := 620ns;

    component Datapath_wrapper is
        port(
            Reset, Clock: in STD_LOGIC;
            Dout, ALUout: out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component Datapath_wrapper;

    begin
    dut : Datapath_wrapper
        port map(
            Reset => reset,
            Clock => clk,
            Dout => mem_out,
            ALUout => ALU_out
        );
        
        clk <= not clk after period / 2;
        
        process
        begin
            wait for period;
            
            reset <= '0';

            wait;
        end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 08:50:25 PM
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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

entity alu_tb is
--  Port ( );
end alu_tb;

architecture Behavioral of alu_tb is
    signal A, B, ALUOut : STD_LOGIC_VECTOR(31 downto 0);
    signal ALUCntl : STD_LOGIC_VECTOR(3 downto 0);
    signal Carryin, Zero, Carryout, Overflow : STD_LOGIC;

    component alu is
        port(
            A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
            ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
            Carryin  : in  STD_LOGIC;
            ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
            Zero     : out  STD_LOGIC;
            Carryout : out std_logic;
            Overflow : out  STD_LOGIC
        );
    end component alu;
    
    begin
    ddut : alu
        port map(
            A => A,
            B => B,
            ALUCntl => ALUCntl,
            Carryin => Carryin,
            ALUOut => ALUOut,
            Zero => Zero,
            Carryout => Carryout,
            Overflow => Overflow
        );
        
        process
        begin
            A <= x"0000000D";
            B <= x"0000000E";
            ALUCntl <= "1100"; --NOR
            Carryin <= '0';
            wait;
        end process;

end Behavioral;

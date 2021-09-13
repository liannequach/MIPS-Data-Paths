----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2021 10:36:47 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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

entity Control is
    port(
        sel : in STD_LOGIC_VECTOR(5 downto 0);
        ALUop : out STD_LOGIC_VECTOR(1 downto 0);
        RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : out STD_LOGIC
    );
end Control;

architecture Behavioral of Control is
begin
    process(sel)
    begin
        case sel is
            -- R-TYPE INSTRUCTIONS
            when "000000" =>
                RegDst <= '1';
                ALUSrc <= '0';
                MemtoReg <= '0';
                RegWrite <= '1';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '0';
                ALUop <= "10";
                
            -- I-TYPE INSTRUCTIONS
            when "100011" => -- lw
                RegDst <= '0';
                ALUSrc <= '1';
                MemtoReg <= '1';
                RegWrite <= '1';
                MemRead <= '1';
                MemWrite <= '0';
                Branch <= '0';
                ALUop <= "00";
            when "101011" => -- sw
                RegDst <= '-';
                ALUSrc <= '1';
                MemtoReg <= '-';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '1';
                Branch <= '0';
                ALUop <= "00";
            when "000100" => -- beq
                RegDst <= '-';
                ALUSrc <= '0';
                MemtoReg <= '-';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '1';
                ALUop <= "01";
            when "000101" => -- bne
                RegDst <= '-';
                ALUSrc <= '0';
                MemtoReg <= '-';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '1';
                ALUop <= "01";
            when others =>
                RegDst <= '-';
                ALUSrc <= '-';
                MemtoReg <= '-';
                RegWrite <= '0';
                MemRead <= '0'; 
                MemWrite <= '0'; 
                Branch <= '0';
                ALUop <= "--";
        end case;
    end process;
end Behavioral;

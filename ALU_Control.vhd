----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2021 05:06:43 PM
-- Design Name: 
-- Module Name: ALU_Control - Behavioral
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

entity ALU_Control is
    port(
        funct : in STD_LOGIC_VECTOR(5 downto 0);
        ALUOp : in STD_LOGIC_VECTOR(1 downto 0);
        OPCode : in STD_LOGIC_VECTOR(5 downto 0);
        ALUCntl : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ALU_Control;

architecture Behavioral of ALU_Control is
begin
    process(ALUOp, funct, OPCode)
    begin
        -- R-TYPE INSTRUCTIONS
        if ALUOp = "10" then
            case funct is
                when "100000" =>
                    ALUCntl <= "0010"; -- ADD
                when "100001" =>
                    ALUCntl <= "0010"; -- ADDU
                when "100010" =>
                    ALUCntl <= "0110"; -- SUB
                when "100011" =>
                    ALUCntl <= "0110"; -- SUBU
                when "100100" =>
                    ALUCntl <= "0000"; -- AND
                when "100101" =>
                    ALUCntl <= "0001"; -- OR
                when "100110" =>
                    ALUCntl <= "0011"; -- XOR
                when "100111" =>
                    ALUCntl <= "1100"; -- NOR
                when "101010" =>
                    ALUCntl <= "0111"; -- SLT
                when "101011" =>
                    ALUCntl <= "0111"; -- SLTU
                when others =>
                    null;
            end case;
            
-- I-TYPE INSTRUCTIONS
        else
            case OPCode is
                when "001000" => --08
                    ALUCntl <= "0010"; -- ADDI (add)
                when "001001" => --09
                    ALUCntl <= "0010"; -- ADDIU (add)
                when "001100" => --0C
                    ALUCntl <= "0000"; -- ANDI (and)
                when "001101" => --0D
                    ALUCntl <= "0001"; -- ORI (or)
                when "100011" =>--23
                    ALUCntl <= "0010"; -- LW (add)
                when "101011" => --2B
                    ALUCntl <= "0010"; -- SW (add)
                when "000100" => --04
                    ALUCntl <= "0110"; -- BEQ (sub)
                when "000101" => --05
                    ALUCntl <= "0110"; -- BNE (sub)
                when "001010" => --0A
                    ALUCntl <= "0111"; -- SLTI (slt)
                when "001011" => --0B
                    ALUCntl <= "0111"; -- SLTIU (slt)
                when others =>
                    null;
            end case;
        end if;
    end process;

end Behavioral;


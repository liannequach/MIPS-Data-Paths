-- VERONICA FUENTES & LEN QUACH
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PCADD is
    port(
        currenti : in STD_LOGIC_VECTOR(31 downto 0);
        nexti : out STD_LOGIC_VECTOR(31 downto 0)
    );
end PCADD;

architecture Behavioral of PCADD is
begin
    nexti <= currenti + x"4";

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ca2bcd is
port( b : in std_logic_vector(3 downto 0);
	c : out std_logic_vector(7 downto 0)
);
end;

architecture behavioral of ca2bcd is
begin
	process(b)
	begin
		if b(3) = '0' then
			c <= "1011" & b(3 downto 0);
		else
			c <= "1101" & std_logic_vector(resize(unsigned(not b) + 1, 4));
		end if;
	end process;
end behavioral;
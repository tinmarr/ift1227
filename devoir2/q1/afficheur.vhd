library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity afficheur is
	port (
		c : in std_logic_vector(7 downto 0);
		affS : out std_logic_vector(6 downto 0);
		affCh : out std_logic_vector(6 downto 0)
	);
end;

architecture behavioral of afficheur is
begin
	process(c)
	begin
		if c(7 downto 4) = "1101" then
			affS <= "0111111";
		elsif c(7 downto 4) = "1011" then
			affS <= "1111111";
		end if;
		
		case c(3 downto 0) is
			when "0000" => affCh <= "1000000";
			when "0001" => affCh <= "1111001";
			when "0010" => affCh <= "0100100";
			when "0011" => affCh <= "0110000";
			when "0100" => affCh <= "0011001";
			when "0101" => affCh <= "0010010";
			when "0110" => affCh <= "0000010";
			when "0111" => affCh <= "1111000";
			when "1000" => affCh <= "0000000";
			when "1001" => affCh <= "0010000";
			when others => affCh <= "1111111";
		end case;
	end process;
end behavioral;

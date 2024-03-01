library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity model_struct is
	port (
		b : in std_logic_vector(3 downto 0);
		affS : out std_logic_vector(6 downto 0);
		affCh : out std_logic_vector(6 downto 0)
	);
end;

architecture structural of model_struct is
	signal c : std_logic_vector (7 downto 0);
	
	component ca2bcd is
		port( b : in std_logic_vector(3 downto 0);
			c : out std_logic_vector(7 downto 0)
		);
	end component;

	component afficheur is
		port (
			c : in std_logic_vector(7 downto 0);
			affS : out std_logic_vector(6 downto 0);
			affCh : out std_logic_vector(6 downto 0)
		);
	end component;
begin
	ca2bcd_inst : ca2bcd
		port map (
			b => b,
			c => c
		);
	
	afficheur_inst : afficheur
		port map (
			c => c,
			affS => affS,
			affCh => affCh
		);
end structural;
		
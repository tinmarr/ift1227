library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detecteur is 
	port (
		clk, reset, a : in STD_LOGIC;
		q : out STD_LOGIC
	);
end;

architecture synth of detecteur is
	type statetype is (SA, SB, SC, SD, SE);
	signal state, nextstate : statetype;
begin
	process(clk, reset) begin
		if reset = '1' then state <= SA;
		elsif clk'event and clk = '1' then
			state <= nextstate;
		end if;
	end process;
	
	process(state, a) begin
		case state is
			when SA => if a = '0' then nextstate <= SB;
				else nextstate <= SA; end if;
			when SB => if a = '0' then nextstate <= SB;
				else nextstate <= SC; end if;
			when SC => if a = '0' then nextstate <= SB;
				else nextstate <= SD; end if;
			when SD => nextstate <= SE;
			when SE => if a = '0' then nextstate <= SB;
				else nextstate <= SA; end if;
		end case;
	end process;
	
	q <= '1' when state = SE else '0';
end synth;
	
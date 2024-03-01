library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detecteur is 
	port (
		clk, reset, a : in STD_LOGIC;
		q : out STD_LOGIC
	);
end;

architecture synth of detecteur is
	type statetype is (S0, S1, S2, S3, S4);
	signal state, nextstate : statetype;
begin
	process(clk, reset) begin
		if reset = '1' then state <= S0;
		elsif clk'event and clk = '1' then
			state <= nextstate;
		end if;
	end process;
	
	process(state, a) begin
		case state is
			when S0 => if a = '0' then nextstate <= S1;
				else nextstate <= S0; end if;
			when S1 => if a = '0' then nextstate <= S1;
				else nextstate <= S2; end if;
			when S2 => if a = '0' then nextstate <= S1;
				else nextstate <= S3; end if;
			when S3 => nextstate <= S4;
			when S4 => if a = '0' then nextstate <= S1;
				else nextstate <= S0; end if;
		end case;
	end process;
	
	q <= '1' when state <= S4 else '0';
end synth;
	
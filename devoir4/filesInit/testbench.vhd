library IEEE;
use IEEE.STD_LOGIC_1164.all; use IEEE.STD_LOGIC_UNSIGNED.all;

entity testbench is --Tp4 
end;

architecture test of testbench is
	component mips
		port(	clk, reset: in STD_LOGIC;
				writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
				memwrite: out STD_LOGIC);
	end component;
	signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
	signal clk, reset, memwrite: STD_LOGIC;
begin
-- instantiate device to be tested
	dut: mips port map (clk, reset, writedata, dataadr, memwrite);
-- Generate clock with 10 ns period
process begin
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
end process;

-- Generate reset for first two clock cycles
process begin
	reset <= '1';
	wait for 20 ns;
	reset <= '0';
	wait;
end process;

-- autoverification
process (clk) begin
	if (clk'event and clk = '0' and memwrite = '1') then
	  case conv_integer(dataadr) is
	    when 80 => if(conv_integer(writedata) = 7) then
			            report "test 1 done";
	               else
							report "test 1: error";
	               end if;
	    when 60 => if(conv_integer(writedata) = 7) then
			            report "test 2 done";
	               else
							report "test 2 : error";
	               end if;
	    when others => report "";
	  end case;       
	end if;
end process;
end;
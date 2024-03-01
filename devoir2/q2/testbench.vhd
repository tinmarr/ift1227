library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
end testbench;

architecture sim of testbench is
    component detecteur
        port(
                clk, reset, a: in std_logic;
                q: out std_logic
        );
    end component;
    signal clk, reset, a, q: std_logic;
begin
    dut: detecteur port map(clk, reset, a, q);
    process begin
        clk <= '0'; reset <= '0'; a <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "0 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "01 failed";
        clk <= '0'; a <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "010 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "0101 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "01011 failed";
        clk <= '0'; a <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '1' report "010110 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "0101101 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '0' report "01011011 failed";
        clk <= '0'; a <= '1'; wait for 10 ns;
        clk <= '1'; wait for 10 ns;
        assert q = '1' report "010110111 failed";
        reset <= '1'; wait for 10 ns;
        assert q = '0' report "reset failed";
		  wait;
    end process;
end sim;
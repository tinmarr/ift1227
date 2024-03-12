-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "03/12/2024 14:55:22"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	model_struct IS
    PORT (
	b : IN std_logic_vector(3 DOWNTO 0);
	affS : BUFFER std_logic_vector(6 DOWNTO 0);
	affCh : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END model_struct;

-- Design Ports Information
-- affS[0]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[1]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[2]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[3]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[5]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affS[6]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[1]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[5]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- affCh[6]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF model_struct IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_affS : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_affCh : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \affS[0]~output_o\ : std_logic;
SIGNAL \affS[1]~output_o\ : std_logic;
SIGNAL \affS[2]~output_o\ : std_logic;
SIGNAL \affS[3]~output_o\ : std_logic;
SIGNAL \affS[4]~output_o\ : std_logic;
SIGNAL \affS[5]~output_o\ : std_logic;
SIGNAL \affS[6]~output_o\ : std_logic;
SIGNAL \affCh[0]~output_o\ : std_logic;
SIGNAL \affCh[1]~output_o\ : std_logic;
SIGNAL \affCh[2]~output_o\ : std_logic;
SIGNAL \affCh[3]~output_o\ : std_logic;
SIGNAL \affCh[4]~output_o\ : std_logic;
SIGNAL \affCh[5]~output_o\ : std_logic;
SIGNAL \affCh[6]~output_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \afficheur_inst|Mux6~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux5~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux4~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux3~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux2~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux1~0_combout\ : std_logic;
SIGNAL \afficheur_inst|Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_b[3]~input_o\ : std_logic;
SIGNAL \afficheur_inst|ALT_INV_Mux0~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_b <= b;
affS <= ww_affS;
affCh <= ww_affCh;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
\ALT_INV_b[3]~input_o\ <= NOT \b[3]~input_o\;
\afficheur_inst|ALT_INV_Mux0~0_combout\ <= NOT \afficheur_inst|Mux0~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N8
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X69_Y54_N23
\affS[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[0]~output_o\);

-- Location: IOOBUF_X78_Y49_N9
\affS[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[1]~output_o\);

-- Location: IOOBUF_X78_Y49_N2
\affS[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[2]~output_o\);

-- Location: IOOBUF_X60_Y54_N9
\affS[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[3]~output_o\);

-- Location: IOOBUF_X64_Y54_N2
\affS[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[4]~output_o\);

-- Location: IOOBUF_X66_Y54_N30
\affS[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \affS[5]~output_o\);

-- Location: IOOBUF_X69_Y54_N30
\affS[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_b[3]~input_o\,
	devoe => ww_devoe,
	o => \affS[6]~output_o\);

-- Location: IOOBUF_X58_Y54_N16
\affCh[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \affCh[0]~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\affCh[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \affCh[1]~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\affCh[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \affCh[2]~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\affCh[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \affCh[3]~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\affCh[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \affCh[4]~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\affCh[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \affCh[5]~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\affCh[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \afficheur_inst|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \affCh[6]~output_o\);

-- Location: IOIBUF_X51_Y54_N29
\b[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: IOIBUF_X51_Y54_N1
\b[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X51_Y54_N22
\b[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X54_Y54_N29
\b[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: LCCOMB_X62_Y53_N8
\afficheur_inst|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux6~0_combout\ = (\b[3]~input_o\ & (\b[2]~input_o\ & (\b[1]~input_o\ $ (!\b[0]~input_o\)))) # (!\b[3]~input_o\ & (!\b[1]~input_o\ & (\b[2]~input_o\ $ (\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux6~0_combout\);

-- Location: LCCOMB_X62_Y53_N2
\afficheur_inst|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux5~0_combout\ = (\b[2]~input_o\ & (!\b[3]~input_o\ & (\b[1]~input_o\ $ (\b[0]~input_o\)))) # (!\b[2]~input_o\ & (\b[1]~input_o\ & (\b[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux5~0_combout\);

-- Location: LCCOMB_X62_Y53_N28
\afficheur_inst|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux4~0_combout\ = (\b[1]~input_o\ & (!\b[0]~input_o\ & (\b[2]~input_o\ $ (!\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux4~0_combout\);

-- Location: LCCOMB_X62_Y53_N22
\afficheur_inst|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux3~0_combout\ = (\b[1]~input_o\ & (\b[2]~input_o\ & \b[0]~input_o\)) # (!\b[1]~input_o\ & (\b[2]~input_o\ $ (\b[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux3~0_combout\);

-- Location: LCCOMB_X62_Y53_N24
\afficheur_inst|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux2~0_combout\ = (\b[0]~input_o\) # ((!\b[1]~input_o\ & \b[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux2~0_combout\);

-- Location: LCCOMB_X62_Y53_N26
\afficheur_inst|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux1~0_combout\ = (\b[1]~input_o\ & ((\b[2]~input_o\ & ((\b[3]~input_o\) # (\b[0]~input_o\))) # (!\b[2]~input_o\ & (!\b[3]~input_o\)))) # (!\b[1]~input_o\ & (\b[0]~input_o\ & ((\b[3]~input_o\) # (!\b[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux1~0_combout\);

-- Location: LCCOMB_X62_Y53_N12
\afficheur_inst|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \afficheur_inst|Mux0~0_combout\ = (\b[1]~input_o\ & (((!\b[0]~input_o\)) # (!\b[2]~input_o\))) # (!\b[1]~input_o\ & ((\b[2]~input_o\) # ((\b[3]~input_o\ & !\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \afficheur_inst|Mux0~0_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_affS(0) <= \affS[0]~output_o\;

ww_affS(1) <= \affS[1]~output_o\;

ww_affS(2) <= \affS[2]~output_o\;

ww_affS(3) <= \affS[3]~output_o\;

ww_affS(4) <= \affS[4]~output_o\;

ww_affS(5) <= \affS[5]~output_o\;

ww_affS(6) <= \affS[6]~output_o\;

ww_affCh(0) <= \affCh[0]~output_o\;

ww_affCh(1) <= \affCh[1]~output_o\;

ww_affCh(2) <= \affCh[2]~output_o\;

ww_affCh(3) <= \affCh[3]~output_o\;

ww_affCh(4) <= \affCh[4]~output_o\;

ww_affCh(5) <= \affCh[5]~output_o\;

ww_affCh(6) <= \affCh[6]~output_o\;
END structure;



-- Adapted from Lauterbach's "Debugging Embedded Cores in Xilinx FPGAs [Zynq]"
-- UNTESTED

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trace_clock_divider is
	Generic (
		TRACE_WIDTH	: positive := 8
	);
	Port (
		clk		: in std_logic;

		s_clk_i	: out std_logic;
		s_ctl	: in std_logic;
		s_data	: in std_logic_vector(TRACE_WIDTH-1 downto 0);

		m_clk_o	: out std_logic;
		m_ctl	: out std_logic;
		m_data	: out std_logic_vector(TRACE_WIDTH-1 downto 0)
	);
end trace_clock_divider;

architecture Behavioral of trace_clock_divider is

	ATTRIBUTE X_INTERFACE_INFO : STRING;

	ATTRIBUTE X_INTERFACE_INFO of s_clk_i: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CLK_I";
	ATTRIBUTE X_INTERFACE_INFO of s_ctl: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CTL";
	ATTRIBUTE X_INTERFACE_INFO of s_data: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ DATA";

	ATTRIBUTE X_INTERFACE_INFO of m_clk_o: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O";
	ATTRIBUTE X_INTERFACE_INFO of m_ctl: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL";
	ATTRIBUTE X_INTERFACE_INFO of m_data: SIGNAL is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";

	signal clk_ddr	: std_logic := '0';

	signal data_q	: std_logic_vector(TRACE_WIDTH-1 downto 0);
	signal ctl_q	: std_logic;

begin

	s_clk_i		<= clk;
	m_clk_o		<= clk_ddr;

	trace_pipeline: process(clk)
	begin
		if rising_edge(clk) then
			clk_ddr <= not clk_ddr;

			data_q <= s_data;
			m_data <= data_q;

			ctl_q <= s_ctl;
			m_ctl <= ctl_q;
		end if;
	end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:10 03/25/2020 
-- Design Name: 
-- Module Name:    NEC_decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NEC_decoder is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ir_bit : in  STD_LOGIC;
           output_command : out  STD_LOGIC_VECTOR (7 downto 0);
           output_address : out  STD_LOGIC_VECTOR (7 downto 0);
			  rdy : out STD_LOGIC);
end NEC_decoder;

architecture Behavioral of NEC_decoder is

type state_type is (idle, leading_pulse, space, data_leading, data_logic_value, stop_bit, send_output, error);
signal state, next_state : state_type;
signal state_duration : integer := 0;
signal read_bits : integer range 0 to 32 := 0; 

signal in_code : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

constant LEADING_PULSE_PREPULSE : integer := 8000000; -- 8ms
constant LEADING_PULSE_TIMEOUT : integer := 11000000;
constant SPACE_PREPULSE : integer := 3000000;
constant SPACE_TIMEOUT : integer := 5500000;
constant DATA_LEADING_PREPULSE : integer := 200000;
constant DATA_LEADING_TIMEOUT : integer := 2300000;
constant DATA_LOGIC_VALUE_PREPULSE : integer := 200000;
constant DATA_LOGIC_VALUE_TIMEOUT : integer := 2300000;
constant STOP_BIT_PREPULSE : integer := 200000;
constant STOP_BIT_TIMEOUT : integer := 2300000;
constant LOGIC_ZERO_TIMEOUT : integer := 1000000;

begin

-- clock , state_duration, state
	clock_tick : process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= idle;
				state_duration <= 0;
			else
				if next_state /= state then
					state_duration <= 0;
				else 
					state_duration <= state_duration + 20;
				end if;
			   state <= next_state;
			end if;
		end if;
	end process clock_tick;
	
-- next_state, in_code, read_bits 
	next_state_process : process(state, ir_bit, state_duration, read_bits, in_code)
	begin 
		next_state <= state;
		
		case state is
		
			when idle =>
				if ir_bit = '0' then
					next_state <= leading_pulse;
				end if;
		
			when leading_pulse =>
				if state_duration > LEADING_PULSE_TIMEOUT then
					next_state <= error;
				elsif ir_bit = '1' then
					if state_duration >= LEADING_PULSE_PREPULSE then
						next_state <= space;
					else
						next_state <= error;
					end if;	
				end if;
			
			when space =>
				if state_duration > SPACE_TIMEOUT then
					next_state <= error;
				elsif ir_bit = '0' then
					if state_duration >= SPACE_PREPULSE then
						next_state <= data_leading;
					else
						next_state <= error;
					end if;
				end if;
				
			when data_leading =>
				if state_duration > DATA_LEADING_TIMEOUT then
					next_state <= error;
				elsif ir_bit = '1' then
					if state_duration >= DATA_LEADING_PREPULSE then
						next_state <= data_logic_value;
					else
						next_state <= error;
					end if;
				end if;
			
			when data_logic_value =>
				if state_duration > DATA_LOGIC_VALUE_TIMEOUT then
					next_state <= error;
				elsif ir_bit = '0' then 
					if state_duration >= DATA_LOGIC_VALUE_PREPULSE then
						if read_bits = 31 then
							next_state <= stop_bit;
						else
							next_state <= data_leading;
						end if;
					else
						next_state <= error;
					end if;
				end if;
				
			when stop_bit =>
				if state_duration > STOP_BIT_TIMEOUT then
					next_state <= error;
				elsif ir_bit = '1' then
					if state_duration >= STOP_BIT_PREPULSE then
						if (in_code(7 downto 0) = not in_code(15 downto 8)) and (in_code(23 downto 16) = not in_code(31 downto 24)) then
							next_state <= send_output;
						else
							next_state <= error;
						end if;
					else
						next_state <= error;
					end if;
				end if;
				
			when send_output =>
				next_state <= idle;
				
			when error =>
				next_state <= idle;
			
		end case;
	
	end process next_state_process;	
	
	
	in_code_process : process(state, clk)
	begin
		if rising_edge(clk) then
			if state = data_logic_value then
				if state_duration <= DATA_LOGIC_VALUE_TIMEOUT and ir_bit = '0' and state_duration >= DATA_LOGIC_VALUE_PREPULSE then
					if state_duration > LOGIC_ZERO_TIMEOUT then
						in_code <= in_code(30 downto 0) & '1';
					else
						in_code <= in_code(30 downto 0) & '0';
					end if;
				end if;
			end if;
		end if;
	end process in_code_process;
	
	
	read_bits_process : process(state, clk)
	begin
		if rising_edge(clk) then
			if state = data_logic_value then
				if state_duration <= DATA_LOGIC_VALUE_TIMEOUT and ir_bit = '0' and state_duration >= DATA_LOGIC_VALUE_PREPULSE then
					if read_bits = 31 then
						read_bits <= 0;
					else
						read_bits <= read_bits + 1;
					end if;
				end if;
			end if;
		end if;
	end process read_bits_process;
		
	
-- rdy, code	
	output_process : process(state, clk)
	begin
		if rising_edge(clk) then
			if state = send_output then
				output_address <= in_code(31 downto 24);
				output_command <= in_code(15 downto 8);
				rdy <= '1';
			else
				rdy <= '0';
			end if;
		end if;
	end process output_process;
	
end Behavioral;


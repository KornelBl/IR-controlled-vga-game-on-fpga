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
           code : out  STD_LOGIC_VECTOR (31 downto 0);
			  rdy : out STD_LOGIC);
end NEC_decoder;

architecture Behavioral of NEC_decoder is

type state_type is (idle, leading_pulse, space, data_leading, data_logical_value, stop_bit);
signal state, next_state : state_type;
signal state_duration : Time := 0 ns;
signal data_counter : Time := 0 ns;
signal read_bits : integer range 0 to 32 := 0; 

constant LEADING_PULSE_PREPULSE : Time := 8 ms;
constant LEADING_PULSE_TIMEOUT : Time := 11 ms;
constant SPACE_PREPULSE : Time := 3 ms;
constant SPACE_TIMEOUT : Time := 5500 us;
constant DATA_LEADING_PREPULSE : Time := 200 us;
constant DATA_LEADING_TIMEOUT : Time := 2300 us;
constant DATA_LOGIC_VALUE_PREPULSE : Time := 200 us;
constant DATA_LOGIC_VALUE_TIMEOUT : Time := 2300 us;
constant LOGIC_ZERO_TIMEOUT : Time := 1 ms;

signal timeout : Time := 0 ns;
signal prepulse : Time := 0 ns;

begin

	clock_tick : process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= idle;
				state_duration <= 0 ns;
			else
			   state <= next_state;
				state_duration <= state_duration + 20 ns;		-- might cause overflow problem, infinitely increasing while in idle, to solve
			end if;
		end if;
	end process clock_tick;
	
	data_check : process(state)
	begin
		next_state <= state;
		
		case state is
		
			when idle =>
				if ir_bit = '0' then
					next_state <= leading_pulse;
					state_duration <= 0 ns;
				end if;
		
			when leading_pulse =>
				if state_duration > LEADING_PULSE_TIMEOUT then
					next_state <= idle;
					state_duration <= 0 ns;
				elsif ir_bit = '1' then
					if state_duration >= LEADING_PULSE_PREPULSE then
						next_state <= space;
						state_duration <= 0 ns;
					else
						next_state <= idle;
						state_duration <= 0 ns;
					end if;	
				end if;
			
			when space =>
				if state_duration > SPACE_TIMEOUT then
					next_state <= idle;
					state_duration <= 0 ns;
				elsif ir_bit = '0' then
					if state_duration >= SPACE_PREPULSE then
						next_state <= data_leading;
						state_duration <= 0 ns;
					else
						next_state <= idle;
						state_duration <= 0 ns;
					end if;
				end if;
				
			when data_leading =>
				if state_duration > DATA_LEADING_TIMEOUT then
					next_state <= idle;
					state_duration <= 0 ns;
				elsif ir_bit = '1' then
					if state_duration >= DATA_LEADING_PREPULSE then
						next_state <= data_logical_value;
						state_duration <= 0 ns;
					else
						next_state <= idle;
						state_duration <= 0 ns;
					end if;
				end if;
			
			when data_logic_value =>
				if state_duration > DATA_LOGIC_VALUE_TIMEOUT then
					next_state <= idle;
					state_duration <= 0 ns;
				elsif ir_bit = '0' then
					if state >= DATA_LOGIC_VALUE_PREPULSE then
						if read_bits = 32 then
							next_state <= stop_bit;
							state_duration <= 0 ns;
							read_bits <= 0;
						else
							next_state <= data_leading;
							state_duration <= 0 ns;
							code <= std_logic_vector(code sll 1);
							if state_duration > LOGIC_ZERO_TIMEOUT then
								code <= code + 1;
							end if;
							read_bits <= read_bits + 1;
						end if;
					else
						next_state <= idle;
						state_duration <= 0 ns;
					end if;
				end if;
				
			when stop_bit =>
				next_state <= idle;
			
		end case;
	
	end process data_check;
	
	output : process(state)
	begin
		if state = stop_bit then
			rdy <= '1';
		else
			rdy <= '0';
		end if;
	end process output;
	
end Behavioral;


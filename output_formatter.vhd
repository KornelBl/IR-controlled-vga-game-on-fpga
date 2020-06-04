----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:49 05/21/2020 
-- Design Name: 
-- Module Name:    output_formatter - Behavioral 
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

entity output_formatter is
    Port ( command : in  STD_LOGIC_VECTOR (0 to 7);
           address : in  STD_LOGIC_VECTOR (0 to 7);
           clk : in  STD_LOGIC;
           rdy_in : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output_byte : out  STD_LOGIC_VECTOR (0 to 7);
           rdy_out : out  STD_LOGIC;
           newline : out  STD_LOGIC);
end output_formatter;

architecture Behavioral of output_formatter is

function bit_to_ascii(signal input : in std_logic_vector(0 to 7))
			return std_logic_vector is variable result : std_logic_vector(0 to 15);
begin
	 case input(0 to 3) is
			when "0000" => result(0 to 7) := X"30" ;
			when "0001" => result(0 to 7) := X"31" ;
			when "0010" => result(0 to 7) := X"32" ;
			when "0011" => result(0 to 7) := X"33" ;
			when "0100" => result(0 to 7) := X"34" ;
			when "0101" => result(0 to 7) := X"35" ;
			when "0110" => result(0 to 7) := X"36" ;
			when "0111" => result(0 to 7) := X"37";
			when "1000" => result(0 to 7) := X"38" ;
			when "1001" => result(0 to 7) := X"39" ;
			when "1010" => result(0 to 7) := X"41" ;
			when "1011" => result(0 to 7) := X"42" ;
			when "1100" => result(0 to 7) := X"43" ;
			when "1101" => result(0 to 7) := X"44" ;
			when "1110" => result(0 to 7) := X"45" ;
			when others => result(0 to 7) := X"46" ;
		end case;
								
	case input(4 to 7) is
			when "0000" => result(8 to 15):= X"30";
			when "0001" => result(8 to 15):= X"31";
			when "0010" => result(8 to 15):= X"32";
			when "0011" => result(8 to 15):= X"33";
			when "0100" => result(8 to 15):= X"34";
			when "0101" => result(8 to 15):= X"35";
			when "0110" => result(8 to 15):= X"36";
			when "0111" => result(8 to 15):= X"37";
			when "1000" => result(8 to 15):= X"38";
			when "1001" => result(8 to 15):= X"39";
			when "1010" => result(8 to 15):= X"41";
			when "1011" => result(8 to 15):= X"42";
			when "1100" => result(8 to 15):= X"43";
			when "1101" => result(8 to 15):= X"44";
			when "1110" => result(8 to 15):= X"45";
			when others => result(8 to 15):= X"46";
	end case;
	return result;
end function;


type state_type is (idle, input_state, output_state);
signal state, next_state : state_type;
signal addr, comm, line : std_logic_vector (0 to 15) := X"0000";
signal line_counter : std_logic_vector (0 to 7) := X"01";
signal char_counter : integer := 0;

begin
	
-- clock , state_duration, state
	clock_tick : process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= idle;
			else
			   state <= next_state;
			end if;
		end if;
	end process clock_tick;	

	state_process: process(state,rdy_in,char_counter)
	begin
		next_state <= state;
		
		case state is
		
			when idle =>
				if rdy_in = '1' then
					next_state <= input_state;
				end if;
				
			when input_state =>
				next_state <= output_state;
				
			when output_state => 
			if char_counter = 17 then
					next_state <= idle;
				end if;

		end case;
	
	end process state_process;
	
	line_counter_process: process(clk,state,line_counter) 
	begin
		if rising_edge(clk) then
			if state = input_state then
				if line_counter(4 to 7) /= X"9" then
					line_counter <= std_logic_vector(unsigned(line_counter)+1);
				elsif line_counter(0 to 3) /= X"9" then
					line_counter <= std_logic_vector(unsigned(line_counter)+7);
				else
					line_counter <= X"00";
				end if;
			end if;
		end if;
	end process line_counter_process;

	input_to_ascii: process(state,clk)
	begin
		if rising_edge(clk) then
			if state = input_state then
				addr <= bit_to_ascii(address);
				comm <= bit_to_ascii(command);
			end if;
		end if;
	end process input_to_ascii;
	
	line_counter_to_ascii: process(state,clk)
	begin
		if rising_edge(clk) then
			if state = input_state then
				line <= bit_to_ascii(line_counter);
			end if;
			
		end if;
	end process line_counter_to_ascii;
	
	ready_process : process(clk,state,char_counter) 
	begin
		if rising_edge(clk) then
			if state = output_state then
				if char_counter mod 2 = 0 then
					rdy_out <= '1';
				else
					rdy_out <= '0';
				end if;
			end if;
		end if;
	end process ready_process;
	
	output_process : process(clk,state,char_counter) 
	begin
		if rising_edge(clk) then
			if state = output_state then
				case char_counter is
					when 0 => output_byte <= line(0 to 7); 
					when 2 => output_byte <= line(8 to 15);
					when 4 => output_byte <= X"29";
					when 6 => output_byte <= X"20";
					when 8 => output_byte <= addr(0 to 7);
					when 10 => output_byte <= addr(8 to 15);
					when 12 => output_byte <= X"20";
					when 14 => output_byte <= comm(0 to 7);
					when 16 => output_byte <= comm(8 to 15);
					when others => output_byte <= X"00";
				end case;
			end if;
		end if;
	end process output_process;

	char_counter_process : process(clk,state) 
	begin
		if rising_edge(clk) then
			if state = output_state then
				char_counter <= char_counter + 1;
			else 
				char_counter <= 0;
			end if;
		end if;
	end process char_counter_process;


	newline_process : process(clk,state,char_counter) 
	begin
		if rising_edge(clk) then
			if state = output_state then
				if char_counter = 17 then
					newline <= '1';
				else
					newline <= '0';
				end if;
			else
				newline <= '0';
			end if;
		end if;
	end process newline_process;

end Behavioral;


--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:49 03/25/2020
-- Design Name:   
-- Module Name:   D:/UCiSW2/IR_Game/NEC_decoder_tb.vhd
-- Project Name:  IR_Game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NEC_decoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NEC_decoder_tb IS
END NEC_decoder_tb;
 
ARCHITECTURE behavior OF NEC_decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NEC_decoder
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ir_bit : IN  std_logic;
         code : OUT  std_logic_vector(31 downto 0);
			rdy : out STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ir_bit : std_logic := '0';
	signal rdy : std_logic := '0';
	
	-- Constants
	constant pulse_time : time := 560 us;
	constant address : std_logic_vector(0 to 7) := "00001111";
	constant command : std_logic_vector(0 to 7) := "11001100";

 	--Outputs
   signal code : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NEC_decoder PORT MAP (
          clk => clk,
          rst => rst,
          ir_bit => ir_bit,
          code => code,
			 rdy => rdy
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	
	simulation_process: process
	begin
		ir_bit <= '1';
		wait for 9 ms;
		ir_bit <= '0';
		wait for 4.5 ms;
		
		--Address
		for i in 0 to 7 loop
			if address(i) = '0' then
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time;
			else
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time*3;
			end if;
		end loop;
		
		--Address inversed
		for i in 0 to 7 loop
			if address(i) = '1' then
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time;
			else
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time*3;
			end if;
		end loop;
				
		--Command 
		for i in 0 to 7 loop
			if command(i) = '0' then
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time;
			else
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time*3;
			end if;
		end loop;		
		
		--Command inversed
		for i in 0 to 7 loop
			if command(i) = '1' then
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time;
			else
				ir_bit <= '1';
				wait for pulse_time;
				ir_bit <= '0';
				wait for pulse_time*3;
			end if;
		end loop;
		--Stop bit
		
		ir_bit <= '1';
		wait for pulse_time;
		ir_bit <= '0';
	
		
	end process;

END;

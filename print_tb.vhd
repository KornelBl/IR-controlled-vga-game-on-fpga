-- Vhdl test bench created from schematic E:\nauka\UCISW2\IR\print_address_and_command.sch - Thu May 07 20:07:00 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY print_address_and_command_print_address_and_command_sch_tb IS
END print_address_and_command_print_address_and_command_sch_tb;
ARCHITECTURE behavioral OF 
      print_address_and_command_print_address_and_command_sch_tb IS 

   COMPONENT print_address_and_command
   PORT( VGA_HS	:	OUT	STD_LOGIC; 
          VGA_VS	:	OUT	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          RST	:	IN	STD_LOGIC; 
          IR_BIT	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL VGA_HS	:	STD_LOGIC;
   SIGNAL VGA_VS	:	STD_LOGIC;
   SIGNAL CLK	:	STD_LOGIC;
   SIGNAL RST	:	STD_LOGIC;
   SIGNAL IR_BIT	:	STD_LOGIC;

	-- Constants
	constant pulse_time : time := 560 us;

   -- Clock period definitions
   constant clk_period : time := 20 ns;


	-- Procedure
	
	procedure SendByte(	constant byte : in std_logic_vector(0 to 7);
								signal in_bit : out std_logic
	) is
	begin
		for i in 0 to 7 loop
			in_bit <= '0';
			wait for pulse_time;
			if byte(i) = '0' then
				in_bit <= '1';
				wait for pulse_time;
			else
				in_bit <= '1';
				wait for pulse_time*3;
			end if;
		end loop;	
	end procedure;
 
 
 	procedure SendNegatedByte(	constant byte : in std_logic_vector(0 to 7);
											signal in_bit : out std_logic
	) is
	begin
		for i in 0 to 7 loop
			in_bit <= '0';
			wait for pulse_time;
			if byte(i) = '1' then
				in_bit <= '1';
				wait for pulse_time;
			else
				in_bit <= '1';
				wait for pulse_time*3;
			end if;
		end loop;	
	end procedure;
	
	
	procedure SendSignal(constant addr: in std_logic_vector(0 to 7);
								constant comm: in std_logic_vector(0 to 7);
								signal in_bit: out std_logic
	)is
	begin
	
			in_bit <= '0';
			wait for 9 ms;
			in_bit <= '1';
			wait for 4.5 ms;
			
			--Address
			SendByte(addr,in_bit);
			
			--Address Negated
			SendNegatedByte(addr,in_bit);
			
			--Command 
			SendByte(comm,in_bit);

			--Command Negated
			SendNegatedByte(comm, in_bit);
			
			--Stop bit
			in_bit <= '0';
			wait for pulse_time;
			in_bit <= '1';
			
	end procedure;
	
BEGIN

   UUT: print_address_and_command PORT MAP(
		VGA_HS => VGA_HS, 
		VGA_VS => VGA_VS, 
		CLK => CLK, 
		RST => RST, 
		IR_BIT => IR_BIT
   );



   -- Clock process definitions
   clk_process :process
   begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
   end process;
	
	
-- *** Test Bench - User Defined Section ***
	simulation_process: process
	begin
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","00110011",IR_BIT);
		wait for 10 ms;
		sendSignal("00001111","11001100",IR_BIT);
		wait for 10 ms;
		
	end process;

-- *** End Test Bench - User Defined Section ***

END;

----------------------------------------------------------------------------------
-- This is written by Zhiyang Ong to verify his
-- behavioral design of an unsigned 32-bit
-- multiplier.


-- Import IEEE VHDL libraries
	LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
--	use arith.all;
	use work.arith.all;

-- Declare an instance of the testbench
	ENTITY mult32_tb IS
	END mult32_tb;

	ARCHITECTURE behavior OF mult32_tb IS
		-- Component Declaration
		COMPONENT <mult32>
			PORT(	ip_a, ip_b : IN std_logic_vector(31 downto 0);       
				opt : OUT std_logic_vector(63 downto 0)
				);
		END COMPONENT;
		
		-- Declaring input signals for the instance of
		-- the multiplier
		SIGNAL <ip1> :  std_logic_vector(31 downto 0);
		SIGNAL <ip2> :  std_logic_vector(31 downto 0);
		SIGNAL <res> :  std_logic_vector(63 downto 0);
		      
		
		BEGIN
		-- Component Instantiation
		uut: <mult32> PORT MAP(
			<ip_a> => <ip1>,
			<ip_b> => <ip2>,
			<opt> => <res>
			);


		--  Test Bench Statements
		tb : PROCESS
		BEGIN
			wait for 100 ns; -- wait until global set/reset completes

			-- Add user defined stimulus here
			ip1 <= to_unsigned(200, 32);
			ip2 <= to_unsigned(15, 32);
			wait for 20 ns;
--			assert(res=3000) report "Error detected!"
--			severity warning;
			ip1 <= to_unsigned(40, 32);
			ip2 <= to_unsigned(1301, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(0, 32);
			ip2 <= to_unsigned(12, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(17, 32);
			ip2 <= to_unsigned(0, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(0, 32);
			ip2 <= to_unsigned(0, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(397, 32);
			ip2 <= to_unsigned(1, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(1, 32);
			ip2 <= to_unsigned(74, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(752, 32);
			ip2 <= to_unsigned(752, 32);
			wait for 20 ns;
			
			ip1 <= to_unsigned(67108864, 32);
			ip2 <= to_unsigned(16, 32);
			wait for 20 ns;
			

			wait; -- will wait forever
		END PROCESS tb;

	--  End Test Bench 
	END;

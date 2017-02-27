----------------------------------------------------------------------------------
-- Engineer: Zhiyang Ong
-- 
-- Create Date:    13:32:34 04/13/2010 
-- Module Name:    multiplier - Behavioral
-- Tool versions: Xilinx ISE 11.1
-- Description: Behavioral model of an unsigned
--						32-bit multiplier.
--						Input: multiplicand, a[31:0]
--						Input: multiplier, b[31:0]
--						Output: product, out[63:0]
--						out[63:0] = a[31:0] * b[31:0]
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--		This is written by Zhiyang Ong to refresh his
--		memory on digital VLSI design using VHDL.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Describe the I/O ports of the unsigned 32-bit
-- multiplier
entity mult32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           op : out  STD_LOGIC_VECTOR (63 downto 0));
end mult32;


-- Describe the behavior of the unsigned 32-bit
-- multiplier
architecture behaviorial of mult32 is
begin
	process(a, b)
		-- Temporary variables to store the operands
		-- and the product
		variable a_reg: std_logic_vector(31 downto 0);
		variable b_reg: std_logic_vector(31 downto 0);
		variable res_reg: std_logic_vector(63 downto 0);
	begin
		-- Store¡¡operands temporarily in these variables
		a_reg := "11111111111111111111111111111111" and a;
		b_reg := "11111111111111111111111111111111" and b;
	
		-- Perform the following operations for each
		-- bit of the multiplicand/multiplier reg,
		-- which are assumed to have the same
		-- bit-vector size.
		-- Since the multiplicand/multiplier reg is
		-- 32-bit wide, perform this loop 32 times.
		for num_rep in 0 to 32 loop
			-- If bit multiplier[0] == 0,
			if b(0) = '1' then
				-- pdt reg = pdt reg + multiplier reg
				res_reg := res_reg + a;
			end if;
		
			-- Shift multiplicand reg left 1 bit
--			a_reg := a_reg sll 1;
			a_reg := a_reg(30 downto 0) & '0';

			-- Shift multiplier reg right 1 bit
--			b_reg := b_reg srl 1;
			b_reg := '0' & b_reg(31 downto 1);

		end loop;
	
	-- Place the contents of the temporary output
	-- register in "op"
	op <= res_reg;
	end process;
end behaviorial;


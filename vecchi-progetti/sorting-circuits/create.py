#!/usr/bin/python
#!/usr/usc/bin/python

"""
This is written by Zhiyang Ong for a Python script to generate
the behavioral RTL model for a sorter in Verilog
It generates the model based on its first input argument that
indicates the number of numbers that it should sort



Synopsis: command name and [argument(s)]
./create.py [number of integers to sort] [number of decimal
		numbers required to represent the largest number in the
		list of integers]
		


This script ./create.py takes in two input arguments.
The first input argument indicates the number of integers that
can be sorted by the digital module.
The second input argument indicates the number of digits (or
decimal numbers) that are needed to represent the largest
integer in the list


e.g. ./create.py 5 6
This sorts 5 numbers, where the largest of these 5 numbers is
represented by 6 decimal numbers.
"""

__author__ = 'Zhiyang Ong'
__version__ = '0.1'
__date__ = 'Mar 3, 2008'

"""
BUG REPORT:
	BUG WORKAROUNDS:
	March 7, 2008 - Implementing for loops within a function
"""

# Import the necessary modules from the Python library
import os, sys, getopt, random, re

##################################################################
# Checking if the input arguments are valid

# Get the entire list of input arguments to this script.
#print "Arguments are:",sys.argv[1:]

# Check if the 1st input argument is an integer?
try:
	# Assume that the first argument exists
	print "Size of the list of random numbers:",sys.argv[1]
except IndexError:
	# The first argument is missing
	raise Exception, "First argument is missing"
# Does this string contain only digits?
# If it contains non-digits, raise an exception to inform
# the user
if re.compile("\D").search(sys.argv[1]) != None:
	raise Exception, "1st argument ain't an integer"

# Check if the 2nd input argument is an integer?
try:
	# Assume that the second argument exists
	print "Number of digits to represent largest integer:",sys.argv[2]
except IndexError:
	# The second argument is missing
	raise Exception, "Second argument is missing"
# If the 2nd argument is not an integer,
if re.compile("\D").search(sys.argv[2]) != None:
	raise Exception, "2nd argument is an integer"
	
	
	
##################################################################
# Generate the Verilog code
# Define classes for the behavioral RTL and the testbench

class Header:
	"""
		Class to generate code for the behavioral RTL model in
		Verilog
	"""

	def __init__(self,op,size,range):
		"""
			Default method that is automatically invoked with the
			class instantiation
			
			COMMENT:
			I cannot use the multi-line comment block after the
			docstrings (documentation strings), else there will
			be an interpretation error - the first token after
			such a block would be considered to cause a syntax
			error due to invalid syntax
			
			BUG WORKAROUND:
			I cannot implement a for loop in this function. Hence, I
			have implemented a while loop to do the enumeration
			instead - March 7, 2008
		"""
		op.write('module gensort(\n')

		# Print the input ports of the digital module
		i = 0
		while i < size:
			op.write('	in')
			op.write(str(i))
			op.write(',\n')
			i = i+1
		#op.write('\n')
		
		# Print the output ports of the digital module
		i = 0
		while i < size:
			op.write('	out')
			op.write(str(i))
			op.write(',\n')
			i = i+1
		op.write('	clk);\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Declare the output ports of the digital module
		i = 0
		while i < size:
			op.write('	output [')
			op.write(str(4*range-1))
			op.write(':0] out')
			op.write(str(i))
			op.write(';\n')
			i = i+1
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		# Declare the input ports of the digital module
		i = 0
		while i < size:
			op.write('	input [')
			op.write(str(4*range-1))
			op.write(':0] in')
			op.write(str(i))
			op.write(';\n')
			i = i+1
		op.write('input clk;\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Declare the output ports as registers as well
		i = 0
		while i < size:
			op.write('	reg [')
			op.write(str(4*range-1))
			op.write(':0] out')
			op.write(str(i))
			op.write(';\n')
			i = i+1
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		# Declare some registers as internal storage variables
		op.write('	reg [')
		op.write(str(4*range-1))
		op.write(':0] out [0:')
		op.write(str(size))
		op.write('];\n')
		
		op.write('	reg [')
		op.write(str(4*range-1))
		op.write(':0] temp;\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		# Declare some integers used to enumerate the array during
		# the sorting process
		op.write('	integer i;\n');
		op.write('	integer j;\n');
		op.write('\n')
		op.write('\n')
		op.write('\n')
		


	def print_body(self,of,sz,rge):
		of.write('	always@(\n')
		# Observe/Track the input arguments/signals of the module
		i = 0
		while i < sz:
			of.write('		in')
			of.write(str(i))
			of.write(' or\n')
			i = i+1
		of.write('		clk)\n')
		of.write('	begin\n')
		
		# Copy the input arguments into an array
		i = 0
		while i < sz:
			of.write('		out[')
			of.write(str(i))
			of.write('] = in')
			of.write(str(i))
			of.write(';\n')
			i = i+1
		of.write('\n')
		of.write('\n')
		of.write('\n')
		
		
		# Bubble sorting algorithm
		of.write('		for(i=0; i<')
		of.write(str(sz))
		of.write('; i=i+1)\n')
		of.write('		begin\n')
		of.write('			for(j=0; j<')
		of.write(str(sz))
		of.write('; j=j+1)\n')
		of.write('			begin\n')
		of.write('				if(out[j] > out[i])\n')
		of.write('				begin\n')
		of.write('					temp = out[j];\n')
		of.write('					out[j] = out[i];\n')
		of.write('					out[i] = temp;\n')
		of.write('				end\n')
		of.write('			end\n')
		of.write('		end\n')
		
		
		# Copy the results into the output arguments
		i = 0
		while i < sz:
			of.write('		out')
			of.write(str(i))
			of.write(' = out[')
			of.write(str(i))
			of.write('];\n')
			i = i+1

		
		
		of.write('	end\n')
		of.write('endmodule\n')














##################################################################
class Test:
	"""
		Class to generate code for the Verilog testbench
	"""

	def __init__(self,op,size,range):
		op.write('`timescale 1ns/10ps\n')
		op.write('`include "gensort.v"\n')
		op.write('module tb_gensort();\n')

		# Declare the input ports of the digital module
		i = 0
		while i < size:
			op.write('	wire [')
			op.write(str(4*range-1))
			op.write(':0] o')
			op.write(str(i))
			op.write(';\n')
			i = i+1
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		# Declare the output ports of the digital module
		i = 0
		while i < size:
			op.write('	reg [')
			op.write(str(4*range-1))
			op.write(':0] i')
			op.write(str(i))
			op.write(';\n')
			i = i+1
		op.write('	reg [')
		op.write(str(4*range-1))
		op.write(':0] i [0:')
		op.write(str(size-1))
		op.write('];\n')
		op.write('	reg clock;\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Declare and instantiate integers for enumerating the array
		op.write('	integer count;\n')
		op.write('	integer md_fopen;\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Declare and instantiate the module under test
		op.write('	gensort gs (\n')
		# Print the input arguments for this module
		i=0
		while i < size:
			op.write('		i')
			op.write(str(i))
			op.write(',\n')
			i = i+1
		# Print the output arguments for this module
		i=0
		while i < size:
			op.write('		o')
			op.write(str(i))
			op.write(',\n')
			i = i+1
		op.write('		clock);\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		# Print the initial block for the testbench
		op.write('	initial\n')
		op.write('	begin\n')
		op.write('		$display($time, "	<< Starting the simulation >>");\n')
		op.write('		$readmemh("numbers.txt",i);\n')
		op.write('		#20\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Assign the input arguments to an array
		i=0
		while i < size:
			op.write('		i')
			op.write(str(i))
			op.write(' = i[')
			op.write(str(i))
			op.write('];\n')
			i = i+1
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Open a file channel descriptor for writing
		op.write('		md_fopen = $fopen("output.txt");\n')
		op.write('		if (md_fopen == 0) $finish;\n')
		op.write('		#20\n')
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		
		# Copy the values of the array into the output file
		i=0
		while i < size:
			op.write('		$fdisplay(md_fopen,"%h",o')
			op.write(str(i))
			op.write(');\n')
			i = i+1
		op.write('\n')
		op.write('\n')
		op.write('\n')
		
		
		# Finishing up...
		op.write('		$fclose(md_fopen);\n')
		op.write('		#30\n')
		op.write('		$display($time, " << Finishing the simulation >>");\n')
		op.write('		$finish;\n')
		op.write('	end\n')
		op.write('endmodule\n')
		








# Create an output file stream so that the behavioral RTL can be
# stored in a file
# FILE OPERATIONS:
# read - r, write - w, read/write - r+
fo = open('gensort.v','w')
vg = Header(fo,int(sys.argv[1]),int(sys.argv[2]))
vg.print_body(fo,int(sys.argv[1]),int(sys.argv[2]))
# Close the output file stream...
fo.close()



# Create an output file stream so that Verilog testbench can be
# stored in a file
# FILE OPERATIONS:
# read - r, write - w, read/write - r+
fo = open('gensorttb.v','w')
vg = Test(fo,int(sys.argv[1]),int(sys.argv[2]))
# Close the output file stream...
fo.close()

# --- END OF PROGRAM ---	--- END OF PROGRAM ---	--- END OF PROGRAM ---
print ""
print ""
print ""
print "Beware of bugs in the above code;"
print "I have only proved it correct, not tried it."
print "			- Prof. Donald Knuth,"
print "			  Stanford University"
#!/usr/bin/python
#!/usr/usc/bin/python

"""
This is written by Zhiyang Ong for a Python script to generate
a list of random numbers that would be sorted by the digital module



Synopsis: command name and [argument(s)]
./random_numbers.py [number of integers to sort] [number of decimal
		numbers required to represent the largest number in the
		list of integers]
		


This script ./random_numbers.py takes in two input arguments.
The first input argument indicates the number of integers that
would be sorted by the digital module.
The second input argument indicates the number of digits (or
decimal numbers) that are needed to represent the largest
integer in the list


e.g. ./random_numbers.py 5 6
This sorts 5 numbers, where the largest of these 5 numbers is
represented by 6 decimal numbers.
"""

__author__ = 'Zhiyang Ong'
__version__ = '0.1'
__date__ = 'Mar 3, 2008'

# Import the necessary modules from the Python library
import os, sys, getopt, random, re, math

##################################################################
# Checking if the input arguments are valid


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
	
	
	
"""
# I wanna determine if an integer can be converted into an integer
print 'Number: %(#)d' % {"#": 5}
# Check if a string of no digits can be converted into an integer
try:
	print 'No digits: %(#)d' % {"#": (5 + int("ewtrew"))}
except ValueError:
	print "I tried in vain to parse a string without digitals"
# Check if a string with digits as a prefix can be converted into an integer
try:
	print 'prefix: %(#)d' % {"#": (5 + int("5673ewtrew"))}
except ValueError:
	print "I tried in vain to parse a string with digits as a prefix"
# Check if a string with digits as a postfix can be converted into an integer
try:
	print 'postfix: %(#)d' % {"#": (5 + int("ewtrew63498"))}
except ValueError:
	print "I tried in vain to parse a string with digits as a postfix"
# Check if a string with digits in the prefix and postfix can be converted into an integer
try:
	print 'prefix and postfix: %(#)d' % {"#": (5 + int("5673ewtrew693"))}
except ValueError:
	print "I tried in vain to parse a string with digits in the prefix and postfix"
# Check if a string with digits in the middle can be converted into an integer
try:
	print 'digits in the middle: %(#)d' % {"#": (5 + int("ewtrew693dgfhqewi"))}
except ValueError:
	print "I tried in vain to parse a string with digits in the middle"
# Check if a string with odd characters can be converted into an integer
try:
	print 'string with odd characters: %(#)d' % {"#": (5 + int("6218@#$%^&*67"))}
except ValueError:
	print "I tried in vain to parse a string with odd characters"
# Check if a string with only digits can be converted into an integer
try:
	print 'Only digits: %(#)d' % {"#": (5 + int("57990"))}
except ValueError:
	print "ValueError SHOULD NOT HAVE OCCURRED!!! There is a BUG!!!"
	print "I should be able to convert a string of digits into a string"
"""
	
######################################################################

def get_largest_number(n):
	"""
	docstring for this function:
	Function to determine if the largest integer that can be represented
	with [sys.argv[2]] digits
	"""
	
	# return (pow(2,n*4) - 1)
	max_limit = {
		'1': 9,
		'2': 99,
		'3': 999,
		'4': 9999,
		'5': 99999,
		'6': 999999,
		'7': 9999999
	}
	
	try:
		return max_limit[n]
	except KeyError:
		return 99999999999999

######################################################################

# Create an output file stream so that random numbers can be stored in
# a file
# FILE OPERATIONS: read - r, write - w, read/write - r+
fo = open('numbers.txt','w')


# Generate the list of random numbers with the specified size,
# which is given as the first argument
for x in range(0,int(sys.argv[1])):
	rand_num = random.randint(1, get_largest_number(sys.argv[2]))
	fo.write(str(rand_num).zfill(int(sys.argv[2])))
	fo.write('\n')

# Close the output file stream...
fo.close()
print ""
print "Beware of bugs in the above code; I have only proved it correct, not tried it."
print "							- Donald Knuth"
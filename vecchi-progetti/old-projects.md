#	Old Projects

##	VLSI Design Projects

###	Digital Electronic Circuit for Sorting Numbers 

Sample *Python* script to generate synthesizable behavioral RTL for a digital combinational circuit to sort numbers (a list of integers). The RTL model for this circuit is based on the size of the list of integers (x), and the magnitude of the largest number in the list (y). File to generate to random numbers: [random_numbers.py](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/sorting-circuits/random_numbers.py); and file to generate the behavioral RTL and its corresponding *Verilog* testbench [create.py](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/sorting-circuits/create.py)

Both *Python* scripts require the arguments x and y. Also, random_numbers.py generates an output file named numbers.txt, and the second script produces the files gensort.v (behavioral RTL) and gensorttb.v (testbench). It is assumed that the testbench reads in the file numbers.txt as the input file. If the input file containing a list of numbers to be sorted changes, this must be updated and reflected in the testbench and the Python script generating it. 


### Encoders and their Corresponding Error Correcting Decoders Based on Coding Theory

A *Perl* script is used to generate the synthesizable behavioral RTL for an encoder and a decoder for error correction using coding theory. The RTL is generated based on a given generator matrix or parity-check matrix. The *Perl* script processes the matrix that is stored in an input file, and creates the pair of corresponding generator and parity-check matrices. Next, these matrices are used to generate the RTL models for the encoder and the decoder.

Files: [vparse.pl](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/vparse.pl) (the *Perl* script), [read_me.md](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/readme.md) (the *readme* file describing how to use the script, what does it do, and what does it not do), [input.txt](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/input.txt) (a sample input text file containing a matrix), and [input_matrices.zip](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/input_matrices.zip) (more files containing matrices). Note that the given generator matrix or parity-check matrix can have its columns rearranged.




















##	Software Projects

###	A Trivial Java Program to Demonstrate Some Programming Concepts

See attached ZIP file for the program: Trivial.zip

To run this program in a UNIX environment, try: make all

It includes implementation of a Java Interface, uses methods from the Java API, and uses abstraction and modularity in the design of the software.




###	Some Random C++ Programs

See attached ZIP file for the programs: cpp_programs.zip




###	Some Ruby and MATLAB Scripts that I have Written 

See: scripts.zip, search.rb, find.rb, and get_food_diary.rb.












#	Return to Home Page

[Return to Home Page](../README.md)


#	Author Information

The MIT License (MIT)

Copyright (c) <2016> Zhiyang Ong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Email address: echo "cukj -wb- 23wU4X5M589 TROJANS cqkH wiuz2y 0f Mw Stanford" | awk '{ sub("23wU4X5M589","F.d_c_b. ") sub("Stanford","d0mA1n"); print $5, $2, $8; for (i=1; i<=1; i++) print "6\b"; print $9, $7, $6 }' | sed y/kqcbuHwM62z/gnotrzadqmC/ | tr 'q' ' ' | tr -d [:cntrl:] | tr -d 'ir' | tr y "\n"		Don't compromise my computing accounts. You have been warned.


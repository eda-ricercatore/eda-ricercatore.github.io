#	Old Projects

##	VLSI Design Projects


###	Verilog RTL Design of Pipelined Wideword Processor

+ *Verilog* RTL design of the 4-stage pipelined *Troy Wideword Processor*, with 128-bit datapath.
+ *Verilog* testbenches have been developed for each *Verilog* module to support unit testing and regression testing. A *Makefile* is provided for "build automation" (or the automation of analyzing and elaborating the RTL designs, and simulating them).
+ See [MarcheProcessor](https://github.com/eda-ricercatore/MarcheProcessor) for the *Verilog* source code for this project.
+ See [TROY_AJM_ZO.pdf](./vlsi-design-projects/TROY_AJM_ZO.pdf) for the project report.
+ See [processor.pdf](./vlsi-design-projects/processor.pdf) for an addendum to the project report.



###	Viterbi Decoder

+ Designed the synthesizable behavioral *Verilog* RTL model of the Viterbi decoder.
+ Developed a model of a digital communications system, which is comprised of its transmitting-end, a noisy communications channel, and its receiving-end. In the transmitting-end of this communications system, data is encoded. In the model of the communications channel, as the data passes through the channel, data is intentionally corrupted randomly. *Verilog*'s random number generator is used to do this. In the receiving-end of this communications system, data is decoded.
+ Developed *Verilog* testbenches for each *Verilog* module in this communications system. Used these testbenches for unit testing and regression testing. A *Makefile* is provided for "build automation" (or the automation of analyzing and elaborating the RTL designs, and simulating them).
+ Carried out static timing analysis on synthesized *Verilog* netlist of the Viterbi decoder.
+ Extracted synthesized *Verilog* netlist of the Viterbi decoder to a *SPICE* netlist, and simulated the *SPICE* netlist with the *Synopsys NanoSim* circuit simulator.
+ See [Viterbi decoder](https://github.com/eda-ricercatore/PicenoDecoders/tree/master/zhiyang_and_andrew) for the *Verilog* source code for this project.
+ See [Viterbi_decoder_AJM_ZO.pdf](./vlsi-design-projects/Viterbi_decoder_AJM_ZO.pdf) for the project report.




###	SRAM Design

Designed a 32-kbit synchronous SRAM with 32-bit words, using 180 nm process technology.

Developed *MATLAB* scripts to evaluate architectural trade-offs between performance (using logical effort analysis) and area usage; see [Modica-SRAM](https://github.com/eda-ricercatore/Modica-SRAM) for the *HSPICE* decks and *MATLAB* scripts that are used during architectural trade-off evaluation, and characterization of inverters for different supply voltages (VDD) and temperatures. It also includes *HSPICE* decks for the characterization of the 6-transistor SRAM cell for different transistor ratios, and the SRAM read and write circuitry.

Co-designed and co-developed the SRAM using schematic entry in *Cadence Virtuoso*.

Performed functional and timing verfication by simulating extracted *SPICE* netlist in *NanoSim*.

See [EE577b_SRAMII_AJM_ZO_20071026144055528.pdf](./vlsi-design-projects/Viterbi_decoder_AJM_ZO.pdf) for a report of this SRAM project.




















###	Digital Electronic Circuit for Sorting Numbers 

Sample *Python* script to generate synthesizable behavioral RTL for a digital combinational circuit to sort numbers (a list of integers). The RTL model for this circuit is based on the size of the list of integers (x), and the magnitude of the largest number in the list (y). File to generate to random numbers: [random_numbers.py](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/sorting-circuits/random_numbers.py); and file to generate the behavioral RTL and its corresponding *Verilog* testbench [create.py](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/sorting-circuits/create.py)

Both *Python* scripts require the arguments x and y. Also, random_numbers.py generates an output file named numbers.txt, and the second script produces the files gensort.v (behavioral RTL) and gensorttb.v (testbench). It is assumed that the testbench reads in the file numbers.txt as the input file. If the input file containing a list of numbers to be sorted changes, this must be updated and reflected in the testbench and the Python script generating it. 


### Encoders and their Corresponding Error Correcting Decoders Based on Coding Theory

A *Perl* script is used to generate the synthesizable behavioral RTL for an encoder and a decoder for error correction using coding theory. The RTL is generated based on a given generator matrix or parity-check matrix. The *Perl* script processes the matrix that is stored in an input file, and creates the pair of corresponding generator and parity-check matrices. Next, these matrices are used to generate the RTL models for the encoder and the decoder.

Files: [vparse.pl](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/vparse.pl) (the *Perl* script), [read_me.md](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/readme.md) (the *readme* file describing how to use the script, what does it do, and what does it not do), [input.txt](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/input.txt) (a sample input text file containing a matrix), and [input_matrices.zip](https://github.com/eda-ricercatore/PicenoDecoders/blob/master/zhiyang_extra_credit_2/scripts/input_matrices.zip) (more files containing matrices). Note that the given generator matrix or parity-check matrix can have its columns rearranged.







### VHDL Design of 32-bit Multiplier

The behavioral *VHDL* design of an unsigned 32-bit multiplier and its testbench is provided as follows: [mult32.vhd](./vlsi-design-projects/mult32.vhd) and [mult32_tb.vhd](./vlsi-design-projects/mult32_tb.vhd).











##	Software Projects

###	A Trivial *Java* Program to Demonstrate Some Programming Concepts

See attached ZIP file for the program: [Trivial.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/Trivial.zip)

To run this program in a *UNIX* environment, try: *make all*

It includes implementation of a *Java* interface, uses methods from the *Java API*, and uses abstraction and modularity in the design of the software.




###	Some Random C++ Programs

See attached ZIP file for the programs: [cpp_programs.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/cpp_programs.zip)




###	Some Ruby and MATLAB Scripts that I have Written

See: [scripts.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/scripts.zip), [search.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/search.rb), [find.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/find.rb), and [get_food_diary.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/get_food_diary.rb).











#	Return to Home Page

[Return to Home Page](../README.md)


#	Author Information

The MIT License (MIT)

Copyright (c) <2016> Zhiyang Ong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Email address: echo "cukj -wb- 23wU4X5M589 TROJANS cqkH wiuz2y 0f Mw Stanford" | awk '{ sub("23wU4X5M589","F.d_c_b. ") sub("Stanford","d0mA1n"); print $5, $2, $8; for (i=1; i<=1; i++) print "6\b"; print $9, $7, $6 }' | sed y/kqcbuHwM62z/gnotrzadqmC/ | tr 'q' ' ' | tr -d [:cntrl:] | tr -d 'ir' | tr y "\n"		Don't compromise my computing accounts. You have been warned.


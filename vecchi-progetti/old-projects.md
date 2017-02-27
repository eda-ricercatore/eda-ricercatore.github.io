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



###	Cycle-accurate SystemC Design of a Content-Addressable Memory (CAM) 

Electronic system-level (ESL) implementation of a content-addressable memory (CAM). Source code for the cycle-accurate *SystemC* model of the CAM: [content_addr_mem.zip](./vlsi-design-projects/content_addr_mem.zip)

This *SystemC* model is not completely verified yet. My ESL design environment crashed spectacularly while I was trying to simulate this design under a considerably extensive set of design conditions. 








##	Software Projects

[Lombardia-STIL](https://github.com/eda-ricercatore/Lombardia-STIL) is a *C++* -based *STIL* parser.







###	A Trivial *Java* Program to Demonstrate Some Programming Concepts

See attached ZIP file for the program: [Trivial.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/Trivial.zip)

To run this program in a *UNIX* environment, try: *make all*

It includes implementation of a *Java* interface, uses methods from the *Java API*, and uses abstraction and modularity in the design of the software.




###	Some Random C++ Programs

See attached ZIP file for the programs: [cpp_programs.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/cpp_programs.zip)




###	Some Ruby and MATLAB Scripts that I have Written

See: [scripts.zip](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/scripts.zip), [search.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/search.rb), [find.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/find.rb), and [get_food_diary.rb](https://github.com/eda-ricercatore/eda-ricercatore.github.io/blob/master/vecchi-progetti/simple-programs/get_food_diary.rb).






##	Other Projects in Electrical Engineering

###	Modeling of Frequency Modulated Signal, Its Transmission, and Demodulation.

A signal is frequency modulated FM, and transmitted across a noisy channel. This FM signal is subsequently demodulated in its phasor form, and the impact and effects of the noise on the signal's integrity is quantified by the signal to noise ratio (SNR)... Two modulating signals are used: a sinusoid and a filtered white Gaussian noise that is random. These modulating signals are modulated, and filtered by a Butterworth filter before demodulation; see [commass051b.m](./other-ee-projects/commass051b.m)  



##	Samples of Technical Writing 


###	Revision Notes about Computer Architecture

[Reports about computer architecture](https://github.com/eda-ricercatore/Treviso-Arch)



###	A Comparison Between Software and VLSI Test Automation

I was required to write a report for my internship at *Symantec*. I proposed to my advisor for my internship class that I write about the similarities and differences between software and VLSI test automation: [A comparison between software and VLSI test automation](./technical-writing/zhiyang_internship_report2.pdf)

When I took the class titled, "Introduction to Software Engineering" at my alma mater, the University of Adelaide, my curiosity was piqued by how the concepts that I learned in software verification, validation, and testing can also be applied to testing electronics. I was also fortunate to be introduced to formal methods by [Dr. Charles Lakos](http://cs.adelaide.edu.au/~charles/), and subsequently, formal verification by [Dr. Rob Esser](http://cs.adelaide.edu.au/~esser/) in my "Software Engineering and Project" class; to my knowledge, Dr Esser is currently a director with Xilinx in Ireland.

However, it wasn't until the winter break of 2004, when I buried myself in the Barr Smith Library, and browsed through "random" journals, conference proceedings, and magazines that I started to delve into looking how similar software engineering and VLSI design are. I was initially looking for material for various topics that I can pick for my Honours/senior thesis, or garner ideas about areas that I would like to do research in when I go to graduate school. 


###	UNIX Course Notes and Presentation Slides, and FAQs for Sun Solaris and the vi text editor

During my first internship, I taught a brief *UNIX* course. The course notes and presentation slides are provided as follows: [UNIX_course_notes.pdf](./technical-writing/UNIX_course_notes.pdf) and [UNIX_course_presentation_slides.pdf](./technical-writing/UNIX_course_presentation_slides.pdf)

In this internship, I also wrote FAQs for *Sun Solaris* and the *vi* text editor: [UNIX_FAQ.pdf](./technical-writing/UNIX_FAQ.pdf) and [vi_faq.pdf](./technical-writing/vi_faq.pdf)

 These documents are under the copyright of the Institute of Microelectronics, Singapore (IME), and I have obtained permission to release documents I wrote about *UNIX*-like operating systems and their utilities. The *UNIX* scripts that I wrote for IME are "deemed as confidential and proprietary", and are part of IME's "intellectual properties". As such, I am not allowed to release them.





###	Crosstalk-aware Gate Sizing using Simulated Annealing

See attached paper for a description of my co-developed project: [iccd2.pdf](./technical-writing/iccd2.pdf)


###	User Manual for the MazeBot

In one of my software engineering classes at my alma mater, the University of Adelaide, my team had to write several software documents, such as the following: software requirements specification (SRS), software project management plan (SPMP), software design description (SDD), and user manual. The SRS, SPMP, and SDD were written based on suggested templates from IEEE standards. I oversaw the write-up for the SDD, and wrote sections for the SRS, SPMP, and SDD. In addition, I wrote the user manual, which was edited by Craig Eales. File [UserManual.pdf](./technical-writing/UserManual.pdf)

The MazeBot software is a combination of Java software and embedded software written in C that controls the motions of a robot/micromouse around a maze. The robot is supposed to traverse a maze, and map the maze and the Java software hosted on a Sun Solaris workstation should display the map, including the current position and orientation of the robot after some delay. Subsequently, the micromouse should traverse from a corner of the maze to its center and to another corner of the maze selected by the user of the Java software. The use of this software system can interact with it using the GUI (graphical user interface) based on Java Swing.

###	The Bar Code Innovation
 
 [Paper on innovation that I wrote for a class on introductory engineering management and intellectual property (IP) law](./technical-writing/the_bar_code_innovation.pdf)

Each student, or pair of students, had to pick an innovation to write about. My teammate, Ben Kaye, and I decided to work on the bar code, which is an ingenious innovation. It is pervasive and exists in most products sold in stores. It had grown from an infeasible idea to becoming a cost-effective solution for managing the supply chain. It is a cheap technology that has brought about dramatic cost savings for inventory management and the retail industry... For me, this is another exposure to the use of simple solutions in solving complex problems. Unfortunately, I am still learning how to develop simpler (and more elegant) solutions for solving problems, rather build magic/silver bullets or one-size-fit-all solution.   





###	Colpitts oscillator

During one of the experimental sessions that I had to do as a sophomore in electronic circuits, control systems, RF hardware and systems, I had to design a Colpitts oscillator with a classmate. It is designed to operate at 20 MHz, and has a percentage total harmonic distortion (%THD) of about 1.3%; see [hfo3.pdf](./technical-writing/hfo3.pdf) 



###	Synchronous AC machines

For my class on electrical machines, and other topics related to electrical energy systems (such as the basics of electrical/power distribution networks), I had to carry out certain experiments with electrical machines (motors and generators), such as DC machines, asynchronous or induction AC machines, synchronous AC machines, and transformers. Here is a write-up for my experiment on synchronous AC machines: [prac4_ees.pdf](./technical-writing/prac4_ees.pdf)










#	Return to Home Page

[Return to Home Page](../README.md)


#	Author Information

The MIT License (MIT)

Copyright (c) <2016> Zhiyang Ong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Email address: echo "cukj -wb- 23wU4X5M589 TROJANS cqkH wiuz2y 0f Mw Stanford" | awk '{ sub("23wU4X5M589","F.d_c_b. ") sub("Stanford","d0mA1n"); print $5, $2, $8; for (i=1; i<=1; i++) print "6\b"; print $9, $7, $6 }' | sed y/kqcbuHwM62z/gnotrzadqmC/ | tr 'q' ' ' | tr -d [:cntrl:] | tr -d 'ir' | tr y "\n"		Don't compromise my computing accounts. You have been warned.


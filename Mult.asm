// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R1 and R2 and stores the result in R3.
// (R1, R2, R3 refer to RAM[1], RAM[2], and RAM[3], respectively.)
// The algorithm is based on repetitive addition.

// put your code here

// Multiplication Loop
// R3 = R1 + R1 + R1 + ... + R1 (R2 times)
	
	// times = R2
	@2
	D=M
	@times
	M=D

	// R3 = 0
	@3
	M=0

(LOOP)
	// if times==0, break
	@times
	D=M
	@END
	D; JEQ

	// times = times - 1 
	@1
	D=D-A
	@times
	M=D
	
	// sum = sum + R1
	@3
	D=M
	@1
	D=D+M
	@3
	M=D
	
	// goto the LOOP again
	@LOOP
	0;JMP

(END)  // infinite loop for end the program
       @END
       0; JMP
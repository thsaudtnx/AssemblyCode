
// ================================= Factorial ==================================
// This program calculates the Factorial F of a given number n 
// 	At run time:
//		- The user should enter the value of n into R0. i.e. RAM[0]
//		- The program then calculate the factorial of n    i.e. F(n)=n!
//			 F(n) = n*(n-1)*(n-2)*......*2*1
//		- The result F(n) should be saved in RAM[1]
//			-- You should also consider the F(0) case.
// ==============================================================================


// put your code here

// n=R0
// if n==0, R1=1 and then end the program
// R1 = n
// Factorial Loop
// n = n-1
// if n == 0 break and end the program
// multiplication loop for R3 = R1*n, then R1 = R3
// goto start Factorial Loop again
	
	// n=R0
	@0
	D=M
	@n
	M=D
	
	//R1=1
	@1
	M = A
	
	//if n==0, end the program
	@n
	D=M
	@END
	D; JEQ
	
	//R1 = n
	@n
	D = M
	@1
	M = D
	
	//factorial loop
(FLOOP)
	//n = n-1
	@n
	D = M
	@1
	D = D-A
	@n
	M = D

	// if n==0, break the FLOOP and end the program
	@n
	D=M
	@END
	D; JEQ
	
	// times = n
	@n
	D=M
	@times
	M=D
	
	// sum for multiplication R3 = 0
	@3
	M = 0

	//multiplication loop R3 = R1*n and then R1 = R3
(LOOP)
	// if times==0, break the multiplication loop and goto UPDATE for R1=R3
	@times
	D=M
	@UPDATE
	D;JEQ
	
	// times = times - 1 
	@1
	D=D-A
	@times
	M=D
	
	// R3 = R3 + R1
	@3
	D=M
	@1
	D=D+M
	@3
	M=D
	
	//goto multiplication loop
	@LOOP
	0;JMP

(UPDATE)
	// Updating R1 = R3
	@3
	D = M
	@1
	M = D

	// goto FLOOP again 
	@FLOOP
	0; JEQ

(END)  // infinite loop that ends the program
       @END
       0; JMP





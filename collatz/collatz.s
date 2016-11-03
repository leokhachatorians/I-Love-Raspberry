.data

.balign 4
string:
	.asciz "Collatz Conjecture for %d took %d steps.\n"

.text
.global main

main:
	PUSH {LR}
	mov r2, #0 	// init how many steps
	LDR r1, =19	// this is our starting number
	MOV r5, r1	// store value of r1 in to r5 for end
	
check_if_one:
	CMP r1, #1	// compare r1 to 1
	BEQ end		// branch to end if r1 == 1

even_or_odd:
	ADD r2, #1	// increment r2
	MOV r3, r1	// store value of r1 before AND
	AND r3, #1	// check least significant bit
	CMP r3, #0	// compare to see if r3 is even
	BEQ is_even

is_odd:
	ADD r2, #1	// increment r2
	MOV r3, r1	// store value of r1 before left shift into r3
	LSL r1, #2	// shift r1 to the left by 2
	SUB r1, r3	// subtract r1 by its value before left shift
	ADD r1, #1 	// add 1 to r1 (3n + 1)
	B check_if_one

is_even:
	ASR r1, #1	// shift r1 to the right by 1
	B check_if_one

end:	
	MOV r1, r5	// set r1 = r5 (this was the original number)
	LDR r0, =string	// load our ascii string into r0
	BL printf	// print out r0
	POP {PC}	// pop the pc
	

address_string: .word string

.global printf

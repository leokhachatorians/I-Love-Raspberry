.data
.balign 4
total_sum:
	.asciz "Total sum of all numbers divisible by 3 or 5 under a 1000: %d\n"

.text
.global main
.global printf
.global scanf

main:
	PUSH	{LR}

	MOV	r2, #0 		// flag if divisible by 3
	MOV	r3, #0		// flag if divisible by 5
	MOV 	r6, #0		// running sum of all divisible nums	

	MOV	r1, #0		// set r1 to zero

incrementer:
	ADD 	r1, #1		// increment r1
	MOV 	r4, r1 		// keep copy of number in r4

division_loop_3:
	SUB	r1, #3		// subtract by 3
	CMP	r1, #0		// compare with zero
	BEQ	set_flag_3_true
	BLE	set_flag_3_false
	B	division_loop_3

set_flag_3_true:
	MOV	r2, #1		// set divisible by 3 flag true
	MOV	r1, r4 		// load number back into r1
	ADD	r6, r6, r1	// add number to our sum
	B	division_loop_5

set_flag_3_false:
	MOV	r2, #0  	// set divisible by 3 flag false
	MOV	r1, r4		// load number back into r1

division_loop_5:
	SUB	r1, #5		// subtract by 5
	CMP	r1, #0		// compare with 0
	BEQ	set_flag_5_true
	BLE	set_flag_5_false
	B	division_loop_5

set_flag_5_true:
	MOV	r3, #1  	// set divisible by 5 flag true
	MOV	r1, r4		// load number back into r1
	CMP	r2, #0		// check if divisible by 3 flag is set
	ADDEQ	r6, r6, r1	// add to our sum if it isnt set
	B	end

set_flag_5_false:
	MOV	r3, #0		// set divisible by flag 5 false
	MOV	r1, r4		// load number back into r1

end:
	LDR	r8, =999	// I need to LDR #999 in since it's too big of a num
	CMP	r1, r8		// and I just compare it this way :|
	BNE	incrementer
	MOV	r1, r6		// load r6 (the total sum) in to r1 for printf purposes
	LDR	r0, =total_sum	// load address of our string into display register
	BL	printf
	POP	{PC}

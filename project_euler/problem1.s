.data
.balign 4
num:
	.int 0

get_input:
	.asciz "Enter a number: "

input:
	.asciz "%d"

string:
	.asciz "Answer: %d"

result:
	.asciz "%d is divisible by: 3<%d> 5<%d>\n"

total_sum:
	.asciz "Total sum is: %d\n"

.text
.global main
.global printf
.global scanf

main:
	PUSH	{LR}

	MOV	r2, #0 	// flag if divisible by 3
	MOV	r3, #0	// flag if divisible by 5
	MOV 	r6, #0	// running sum of all divisible nums	

	LDR	r0, =get_input
	BL	printf
	LDR	r0, =input
	LDR	r1, =num
	BL	scanf

	LDR	r1, =num
	LDR	r1, [r1]

	MOV 	r4, r1 // keep copy of number in r4

division_loop_3:
	SUB	r1, #3
	CMP	r1, #0
	BEQ	set_flag_3_true
	BLE	set_flag_3_false
	B	division_loop_3

set_flag_3_true:
	MOV	r2, #1	// set divisible by 3 flag true
	MOV	r1, r4 	// load number back into r1
	ADD	r6, r6, r1	// add number to our sum
	B	division_loop_5

set_flag_3_false:
	MOV	r2, #0  // set divisble by 3 flag false
	MOV	r1, r4	// load number back into r1

division_loop_5:
	SUB	r1, #5
	CMP	r1, #0
	BEQ	set_flag_5_true
	BLE	set_flag_5_false
	B	division_loop_5

set_flag_5_true:
	MOV	r3, #1  // set divisble by 5 flag true
	MOV	r1, r4	// load number back into r1
	CMP	r2, #0	// check if divisble by 3 flag is set
	ADDNE	r6, r6, r1	// add to our sum if it isnt set
	B	end

set_flag_5_false:
	MOV	r3, #0	// set divisble by flag 5 false
	MOV	r1, r4	// load number back into r1

end:
	LDR	r0, =result
	BL 	printf
	MOV	r1, r6	// load r6 in to r1 for printf purposes
	LDR	r0, =total_sum
	BL	printf
	POP	{PC}
		

	

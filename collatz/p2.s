.data

.balign 4
num:
	.int 0

input:
	.asciz "%d"

even_result:
	.asciz "Even\n"

odd_result:
	.asciz "Odd\n"

.text
.global main
.global printf
.global scanf

main:
	PUSH	{LR}
	LDR	r0, =input
	LDR	r1, =num
	BL	scanf

	LDR	r1, =num
	LDR	r1, [r1]
	MOV	r2, r1 // placeholder

	AND	r1, #1
	CMP	r1, #0
	BEQ	even

odd:
	LDR	r0, =odd_result
	BL	printf
	B	end

even:
	LDR 	r0, =even_result
	BL	printf	

end:
	POP {PC}
	
	


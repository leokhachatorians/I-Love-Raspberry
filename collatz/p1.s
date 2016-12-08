.data

.balign 4
num1:	.int 0
num2:	.int 0
input:	.asciz "%d%d"
output:	.asciz "%d\n%d\n"

.text
.global main
.global printf
.global scanf

main:
	PUSH	{LR}
	LDR	r0, =input
	LDR	r1, =num1
	LDR	r2, =num2
	BL	scanf

	LDR	 r1, =num1
	LDR	 r2, =num2
	
	LDR	 r1, [r1]
	LDR	 r2, [r2]

	LDR	r0, =output
	BL	printf
	POP 	{PC}

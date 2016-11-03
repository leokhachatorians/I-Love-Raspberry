.text
.global main

main:
	mov r1, #4
	and r1, #1	// Check least significant bit
	cmp r1, #0
	beq is_even

is_odd:
	mov r0, #0
	b end

is_even:
	mov r0, #1

end:
	bx lr

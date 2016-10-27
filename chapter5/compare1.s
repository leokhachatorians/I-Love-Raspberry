.text
.global main

main:
	mov r1, #2 	// r1 = 2
	mov r2, #3 	// r2 = 3
	cmp r1, r2 	// compare r1 and r2
	beq case_equal	// branch if equal

case_equal:
	mov r1, #0 	// r1 = 0

case_different:
	mov r0, #2	// r0 = 2
	b end

end:
	bx lr

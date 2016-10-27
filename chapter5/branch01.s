.text
.global main
main:
	mov r0, #2 	// r0 = 2
	b end		// branch to end
	mov r0, #3	// would set r0 = 3 but never reached

end:
	bx lr

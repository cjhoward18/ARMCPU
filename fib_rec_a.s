.text

.balign 4

.global fib_rec_a
.func fib_rec_a

setup:
	mov r0, #4
	bl fib_rec

done:
	bl done

fib_rec:
	sub sp, sp, #4
	str lr, [sp]
	sub sp, sp, #4
	str r4, [sp]
	sub sp, sp, #4
	str r0, [sp]
	cmp r0, #2
	blt exit
	sub r0, r0, #1
	bl fib_rec
	mov r4, r0
	ldr r0, [sp]
	add sp, sp, #4
	sub r0, r0, #2
	sub sp, sp, #4
	str r0, [sp]
	bl fib_rec
	add r0, r4, r0

exit:
	add sp, sp, #4
	ldr r4, [sp]
	add sp, sp, #4
	ldr lr, [sp]
	add sp, sp, #4
	bx lr

.text

.balign 4

.global sum_array_a
.func sum_array_a

setup:
        /* set sp to 1024 */
        mov sp, #128
        add sp, sp, sp
        add sp, sp, sp

        /* put ints onto array on stack */
        sub sp, sp, #4
        mov r0, #1
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #2
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #3
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #4
        str r0, [sp] 
        sub sp, sp, #4
        mov r0, #5
        str r0, [sp]
       
        /* setup args */
        mov r0, sp
        mov r1, #5

        /* call sum_array */
        bl sum_array

        /* end in infinite loop */
done:
        b done

sum_array:
	mov r2, #0

loop:	
	cmp r1, #1
	blt endloop
	ldr r3, [r0]
	add r0, r0, #4
	add r2, r2, r3
	sub r1, r1, #1
	b loop
	
endloop:
	mov r0, r2
	bx lr


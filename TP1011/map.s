@ procedure map
@ parametres : A COMPLETER
@ algorithme : A COMPLETER
@ allocation des registres : A COMPLETER

		.text
		.global	map
map:
	push {r4, r5, r6, r7, r8, lr}
	
	mov r5, #0			@ r5 = i = 0
	add r6, r0, r5		@ r6 = &t1[i]
	mov r7, r3			@ r7 = f
	add r8, r2, r5		@ r8 = &t2[i]
	
tq:	cmp r5, r1
	beq fintq
	add r6, r0, r5
	ldrb r3, [r6]
	blx r7
	add r8, r2, r5
	strb r4, [r8]
	add r5, r5, #1
	b tq
fintq:
	
	pop {r4, r5, r6, r7, r8, lr}
	bx lr

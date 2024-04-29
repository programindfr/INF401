@ procedure map
@ parametres : A COMPLETER
@ algorithme : A COMPLETER
@ allocation des registres : A COMPLETER

		.text
		.global	map
map:
	push {lr}
	push {fp}
	mov fp, sp
	push {r0, r1, r2, r3, r4, r5, r6}
	
	mov r5, #0			@ r5 = i = 0
	
	ldr r0, [fp, #8]	@ r0 = t1
	ldr r1, [fp, #12]	@ r1 = NMAX
	ldr r2, [fp, #16]	@ r2 = t2
	ldr r6, [fp, #20]	@ r6 = f
	
tq:	cmp r5, r1
	beq fintq
	ldrb r3, [r0, r5]
	blx r6
	strb r4, [r2, r5]
	add r5, r5, #1
	b tq
fintq:
	
	pop {r0, r1, r2, r3, r4, r5, r6}
	pop {fp}
	pop {lr}
	bx lr

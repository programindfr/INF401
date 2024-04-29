@ fonction red
@ parametres : A COMPLETER
@ algorithme : A COMPLETER
@ allocation des registres : A COMPLETER

         .text
         .global  red
red:
    push {r5, r6, r7, r8, r9, lr}
	
	mov r5, #0			@ r5 = i = 0
	mov r6, r2          @ r6 = acc = r2
	mov r7, r0			@ r7 = t
	mov r8, r1			@ r8 = r1 = n
		
tq:	cmp r5, r8
	beq fintq
	
	add r9, r7, r5
	ldrb r1, [r9]
	mov r0, r6
	blx r3
	
	mov r6, r2
	add r5, r5, #1
	b tq
fintq:
	mov r4, r6
	pop {r5, r6, r7, r8, r9, lr}
	bx lr

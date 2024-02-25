	.data
debutTAB: .skip 5

	.text
	.global main
main:
	ldr r0, ptr_debutTAB

	mov r3, #11                @ val <- 11
	mov r2, #0                 @ i <- 0
tq:	cmp r2, #4                 @ i-4 ??
		bgt fintq
			@ i-4 <= 0
			ldr r0, ptr_debutTAB    @ r0 <- debutTAB
			add r0, r0, r2  		@ r0 <- r0 + r2 = debutTAB + i
			strb r3, [r0]           @ MEM[debutTAB+i] <- val
			add r2, r2, #1          @ i <- i + 1
			add r3, r3, #11         @ val <- val + 11
		b tq
fintq:  @ i-4 > 0

fin:	BX LR

ptr_debutTAB: .word debutTAB


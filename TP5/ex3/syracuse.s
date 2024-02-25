	.text
	.global main
main:
	mov r1, #15				@ x <- 15
tq:	cmp r1, #1				@ x - 1 ??
	beq fintq
	@ x - 1 <> 1

si:	tst r1, #1				@ x pair ??
	bne sinon
alors:
	mov r1, r1, LSR #1		@ x <- x/2
	b finsi
sinon:
	add r1, r1, r1, LSL #1	@ x <- x + x*2
	add r1, #1				@ x <- x + 1
finsi:

	b tq
fintq:						@ x - 1 == 0

	@ bl EcrNdecimal32

fin:	BX LR


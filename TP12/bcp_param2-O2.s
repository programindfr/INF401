	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"bcp_param2.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L2
	sub	sp, sp, #40
	add	r1, sp, #36
	mov	r0, r4
	bl	scanf
	add	r1, sp, #32
	mov	r0, r4
	bl	scanf
	add	r1, sp, #28
	mov	r0, r4
	bl	scanf
	add	r1, sp, #24
	mov	r0, r4
	bl	scanf
	add	r1, sp, #20
	mov	r0, r4
	bl	scanf
	add	r1, sp, #16
	mov	r0, r4
	bl	scanf
	add	r1, sp, #12
	mov	r0, r4
	bl	scanf
	add	r1, sp, #8
	mov	r0, r4
	bl	scanf
	add	r1, sp, #4
	mov	r0, r4
	bl	scanf
	mov	r1, sp
	mov	r0, r4
	bl	scanf
	ldr	r3, [sp, #32]
	ldr	r1, [sp, #36]
	add	r1, r1, r3
	ldr	r3, [sp, #28]
	add	r1, r1, #10
	add	r1, r1, r3
	ldr	r3, [sp, #24]
	add	r1, r1, r3
	ldr	r3, [sp, #20]
	add	r1, r1, r3
	ldr	r3, [sp, #16]
	add	r1, r1, r3
	ldr	r3, [sp, #12]
	add	r1, r1, r3
	ldr	r3, [sp, #8]
	add	r1, r1, r3
	ldr	r3, [sp, #4]
	add	r1, r1, r3
	ldr	r3, [sp, #0]
	ldr	r0, .L2+4
	add	r1, r1, r3
	bl	printf
	add	sp, sp, #40
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.space	1
.LC1:
	.ascii	"La somme des entiers de 1 a 10 plus 10 vaut %d\012\000"
	.ident	"GCC: (GNU) 4.5.3"

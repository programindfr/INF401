	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"bcp_param3.c"
	.text
	.align	2
	.type	Somme, %function
Somme:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #68
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #4]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #8]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #12]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #16]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #20]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #24]
	add	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	Somme, .-Somme
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"La somme des entiers de 1 a 10 plus 10 vaut %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	sub	r3, fp, #12
	ldr	r0, .L3
	mov	r1, r3
	bl	scanf
	ldr	r3, [fp, #-12]
	str	r3, [sp, #0]
	mov	r3, #6
	str	r3, [sp, #4]
	mov	r3, #7
	str	r3, [sp, #8]
	mov	r3, #8
	str	r3, [sp, #12]
	mov	r3, #9
	str	r3, [sp, #16]
	mov	r3, #10
	str	r3, [sp, #20]
	mov	r0, #1
	mov	r1, #2
	mov	r2, #3
	mov	r3, #4
	bl	Somme
	str	r0, [fp, #-8]
	ldr	r0, .L3+4
	ldr	r1, [fp, #-8]
	bl	printf
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (GNU) 4.5.3"

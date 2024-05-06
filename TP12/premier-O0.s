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
	.file	"premier.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Donner une chaine de longueur inferieure a %d:\012\000"
	.align	2
.LC1:
	.ascii	"la chaine lue est : %s\012\000"
	.align	2
.LC2:
	.ascii	"la longueur de la chaine lue est : %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, .L2
	mov	r1, #10
	bl	printf
	ldr	r3, .L2+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #20
	mov	r0, r2
	mov	r1, #10
	mov	r2, r3
	bl	fgets
	sub	r3, fp, #20
	ldr	r0, .L2+8
	mov	r1, r3
	bl	printf
	sub	r3, fp, #20
	mov	r0, r3
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, .L2+12
	ldr	r1, [fp, #-8]
	bl	printf
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	_impure_ptr
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (GNU) 4.5.3"

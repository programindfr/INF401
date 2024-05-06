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
	.file	"var_pile.c"
	.text
	.align	2
	.global	Compare2Chaines
	.type	Compare2Chaines, %function
Compare2Chaines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	b	.L2
.L4:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L4
.L3:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	mov	r3, #1
	b	.L6
.L5:
	mov	r3, #0
.L6:
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	Compare2Chaines, .-Compare2Chaines
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Chaine 1, de moins de 99 caracteres : \000"
	.align	2
.LC1:
	.ascii	"Chaine 2, de moins de 99 caracteres : \000"
	.align	2
.LC2:
	.ascii	"oui\000"
	.align	2
.LC3:
	.ascii	"non\000"
	.align	2
.LC4:
	.ascii	"Sont-elles egales ? %s !\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #208
	ldr	r0, .L10
	bl	puts
	ldr	r3, .L10+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #108
	mov	r0, r2
	mov	r1, #100
	mov	r2, r3
	bl	fgets
	ldr	r0, .L10+8
	bl	puts
	ldr	r3, .L10+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	sub	r2, fp, #208
	mov	r0, r2
	mov	r1, #100
	mov	r2, r3
	bl	fgets
	sub	r2, fp, #108
	sub	r3, fp, #208
	mov	r0, r2
	mov	r1, r3
	bl	Compare2Chaines
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	beq	.L8
	ldr	r3, .L10+12
	b	.L9
.L8:
	ldr	r3, .L10+16
.L9:
	ldr	r0, .L10+20
	mov	r1, r3
	bl	printf
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LC0
	.word	_impure_ptr
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (GNU) 4.5.3"

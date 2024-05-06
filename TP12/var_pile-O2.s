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
	.file	"var_pile.c"
	.text
	.align	2
	.global	Compare2Chaines
	.type	Compare2Chaines, %function
Compare2Chaines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L5
	ldrb	r2, [r1, #0]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r0, r2
	bxeq	lr
	cmp	r3, r2
	bne	.L7
	add	r1, r1, #1
	b	.L4
.L11:
	ldrb	r2, [r1], #1	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L8
	cmp	r3, r2
	bne	.L7
.L4:
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	mov	r2, r1
	bne	.L11
.L2:
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L7:
	mov	r0, #0
	bx	lr
.L8:
	mov	r0, r2
	bx	lr
.L5:
	mov	r2, r1
	b	.L2
	.size	Compare2Chaines, .-Compare2Chaines
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L15
	sub	sp, sp, #204
	ldr	r0, .L15+4
	bl	puts
	ldr	r3, [r4, #0]
	add	r5, sp, #100
	ldr	r2, [r3, #4]
	mov	r1, #100
	mov	r0, r5
	bl	fgets
	ldr	r0, .L15+8
	bl	puts
	ldr	r3, [r4, #0]
	mov	r0, sp
	ldr	r2, [r3, #4]
	mov	r1, #100
	bl	fgets
	mov	r1, sp
	mov	r0, r5
	bl	Compare2Chaines
	ldr	r3, .L15+12
	ldr	r1, .L15+16
	movs	r0, r0, asl #16
	movne	r1, r3
	ldr	r0, .L15+20
	mov	r4, sp
	bl	printf
	add	sp, sp, #204
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	_impure_ptr
	.word	.LC2
	.word	.LC3
	.word	.LC0
	.word	.LC1
	.word	.LC4
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"oui\000"
.LC1:
	.ascii	"non\000"
.LC2:
	.ascii	"Chaine 1, de moins de 99 caracteres : \000"
	.space	1
.LC3:
	.ascii	"Chaine 2, de moins de 99 caracteres : \000"
	.space	1
.LC4:
	.ascii	"Sont-elles egales ? %s !\012\000"
	.ident	"GCC: (GNU) 4.5.3"

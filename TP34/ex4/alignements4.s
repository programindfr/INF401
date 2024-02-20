	.data
x:
	.byte	0x01
y:
	.byte	0x02
z:
	.byte	0x03
	.balign 2
a:
	.hword	0x0a0b

	.text
	.global main
main:
	ldr r2, LD_x
	ldr r1, [r2]
	bl EcrHexa8
	
	ldr r2, LD_y
	ldr r1, [r2]
	bl EcrHexa8
	
	ldr r2, LD_z
	ldr r1, [r2]
	bl EcrHexa8
	
	ldr r2, LD_a
	ldr r1, [r2]
	bl EcrHexa16

fin:	B exit

LD_x:	.word	x
LD_y:	.word	y
LD_z:	.word	z
LD_a:	.word	a

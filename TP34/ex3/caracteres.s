    .data
cc: @ ne pas modifier cette partie
    .byte 0x42
    .byte 0x4f
    .byte 0x4e
    .byte 0x4a
    .byte 0x4f
    .byte 0x55
    .byte 0x52
    .byte 0x00     @ code de fin de chaine
    .word 12		@ la suite pourra etr emofifiee
    .word 0x11223344
au:    .asciz "au revoir..."

    .text
    .global main
main:

@ impression de la chaine de caractere d'adresse cc
     ldr r1, LD_cc
     bl EcrChaine

@ impression de la chaine "au revoir..."
	ldr r1, LD_cc
	add r1, #16
	bl EcrChaine
	
	ldr r1, LD_au
	bl EcrChaine

@ modification de la chaine d'adresse cc
	ldr r2, LD_cc
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #1
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #2
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #3
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #4
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #5
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	
	ldr r2, LD_cc
	add r2, #6
	ldr r3, [r2]
	add r3, #32
	strb r3, [r2]
	

@ impression de la chaine cc modifiee
     ldr r1, LD_cc
     bl EcrChaine

fin: B exit  @ terminaison immédiate du processus (plus tard on saura faire mieux)

LD_cc: .word cc
LD_au: .word au

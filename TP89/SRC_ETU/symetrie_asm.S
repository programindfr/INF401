                                       
@  Importation des,constantes symboliques WIDTH, HEIGHT, BYTES, BYTES_PER_LINE          
#include "image_bits_include.h"      
#include "tabsym.c"  
                                       
                 .global symetrie_octet
                 .global permuter_cols 
                 .global symetrie_axe_v
                 .global permuter_ligne
                 .global symetrie_axe_h
                 .global symetrie_axe_h
                 .global permuter_lignes                                                
                 .global symetrie_axe_v
                                       
                 .text                 
                                       
@ r0 : parametre reçu adresse          
@ r1 : variable locale octet           
                                       
#ifndef C_SYMETRIE_OCTET               
#ifndef SYMTAB                         
                                       
@  Version avec opérations bit à bit   
                                       
symetrie_octet:
	push {r1, r2, r3, r4}
	mov r1, r0
	
	and r2, r1, 0xF0     // echange de quartets adjacents
	mov r2, r2, LSR #4
	and r3, r1, 0x0F
	mov r3, r3, LSL #4
	orr r4, r2, r3
	
	and r2, r1, 0xCC      // echange de quartets adjacents
	mov r2, r2, LSR #2
	and r3, r1, 0x33
	mov r3, r3, LSL #2
	orr r4, r2, r3
	
	and r2, r1, 0xAA       // echange de quartets adjacents
	mov r2, r2, LSR #1
	and r3, r1, 0x55
	mov r3, r3, LSL #1
	orr r4, r2, r3
	
	mov r0, r1
	pop {r1, r2, r3, r4}
	bx lr
                                       
#else  // SYMTAB                       
                                       
@ Version tabulée                      
symetrie_octet:
	push {r1, r2, r3}
	mov r1, r0
	
	ldr r2, adr_tabsym
	add r2, r2, r1
	ldr r3 , [r2]
	mov r1, r3
	
	mov r0, r1
	pop {r1, r2, r3}
	bx lr
#endif  // SYMTAB                      
#endif  // C_SYMETRIE_OCTET            
@ r0 : parametre tab                   
@ r1 : parametre col                   
                                       
#ifndef C_PERMUTER_COLS                
                                       
permuter_cols:
	push {r3, r2, r5, r4}
	ldr r3, adr_bytespl
	sub r3, r3, #1
	sub r3, r3, r1
	add r2, r0, r3			@ r2 = poiteur vers tab[BYTES_PER_LINE -1 - col]
	ldrb r5, [r2]			@ r5 = tmp
	
	ldrb r4, [r0, r1]
	strb r4, [r2]

	strb r5, [r0, r1]
	pop {r3, r2, r5, r4}
	bx lr
#endif // C_PERMUTER_COLS              
                                       
@ r0 : paramètre image                 
                                       
#ifndef C_SYMETRIE_AXE_V               
symetrie_axe_v:
	push {lr, r6, r2, r3, r4, r5, r7, r8, r9, r10}
	
	mov r6, #0				@ position
	mov r2, #0				@ li
	mov r3, #0				@ col
	mov r4, #0				@ adresse
	ldr r5, adr_bytes		@ BYTES
	mov r7, r0				@ image
	ldr r8, adr_height		@ HEIGHT
	ldr r9, adr_bytespl		@ BYTES_PER_LINE
	mov r10, r9, LSR #1		@ BYTES_PER_LINE/2
	
tq1:
	cmp r6, r5
	bge fintq1
	add r0, r6, r7
	bl symetrie_octet
	mov r6, r6, #1
	b tq1
fintq1:

tq2:
	cmp r2, r8
	bge fintq2
	mul r4, r2, r9
	add r4, r4, r7
	mov r3, #0
tq3:
	cmp r3, r10
	bge fintq3
	mov r0, r4
	mov r1, r3
	bl permuter_cols
	mov r3, r3, #1
	b tq3
fintq3:
	mov r2, r2, #1
	b tq2
fintq2:

	pop {lr, r6, r2, r3, r4, r5, r7, r8, r9, r10}
	bx lr

#endif // C_SYMETRIE_AXE_V             
@ r0 : tab                             
@ r1 : li                              
                                       
#ifndef C_PERMUTER_LIGNES              
permuter_lignes:
	push {r2, r3, r4, r5, r6, r7, r8, r9}
	
	mov r2, r0				@ tab
	mov r3, r1 				@ li
	ldr r4, adr_height		@ HEIGHT
	mov r5, #0				@ tmp
	ldr r6, adr_bytespl		@ BYTES_PER_LINE
	mov r7, #0
	mov r8, #0
	mov r9, #0
	
	mul r7, r6, r3
	add r7, r7, r2
	ldr r5, [r7]
	
	sub r8, r4, #1
	sub r8, r8, r3
	ldrb r9, [r2, r8]
	strb r9, [r7]
	
	strb r5, [r2, r8]
	
	
	pop {r2, r3, r4, r5, r6, r7, r8, r9}
	bx lr
                                       
#endif // C_PERMUTER_LIGNES            
                                       
@ r0 : paramètre image                 
                                       
#ifndef  C_SYMETRIE_AXE_H              
symetrie_axe_h:
	push {lr, r1, r2, r3, r4, r5}
	
	mov r1, #0				@ li
	mov r2, #0				@ col
	ldr r3, adr_height		@ HEIGHT
	mov r3, r3, LSR #1		@ HEIGHT/2
	ldr r4, adr_bytespl		@ BYTES_PER_LINE
	mov r5, r0				@ image

tq1:
	cmp r1, r3
	bge fintq1
	
tq2:	
	cmp r2, r4
	bge fintq2	
	add r0, r2, r5
	bl permuter_lignes
	mov r2, r2, #1
	b tq2
	
fintq2:
	mov r1, r1, #1
	b tq1
	
fintq1:
	
	pop {lr, r1, r2, r3, r4, r5}
	bx lr
                                       
#endif   // C_SYMETRIE_AXE_H    

adr_bytespl:	.word BYTES_PER_LINE
adr_tabsym:		.word tabsym_octet
adr_bytes:		.word BYTES
adr_height:		.word HEIGHT

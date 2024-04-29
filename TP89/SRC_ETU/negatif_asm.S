                                                                                      
@  Importation des,constantes symboliques WIDTH, HEIGHT, BYTES, BYTES_PER_LINE        
#include "image_bits_include.h"                                                       
										      
                                                                                      
                 .text                                                                
                                                                                      
@ r0 : parametre octet                                                                
                                                                                      
#ifndef C_NEG_OCTET                                                                   
                 .global neg_octet                                                    
                                                                                      
neg_octet:
	mvn r0, r0
	bx lr
                                                                                      
#endif // C_NEG_OCTET                                                                 
                                                                                      
#ifndef C_NEG_IMAGE                                                               
                 .global neg_image                                                    
@ r0 : parametre reçu image                                                           
                                                                                      
                                                                                      
neg_image:
	push {lr}
	mov r1, r0						@ addr <- address
	ldr r3, adr_bytes				@ r3 <- adr_bytes
	add r2, r0, r3					@ r2 <- address + BYTES
	
tq:	cmp r1, r2						@ r1 - r2 ??
	bge fintq						
	ldrb r0, [r1]					@ r0 <- [r1]=[address]
	bl neg_octet
	strb r0, [r1]					@ [r1]=[address] <- r5
	add r1, r1, #1					@ r1 <- r1 + 1
	b tq
fintq:

	pop {lr}
	bx lr                                                           
                                                                                      
adr_bytes:	.word BYTES
#endif // C_NEG_IMAGE                                                                 

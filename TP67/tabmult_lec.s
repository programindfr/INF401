@ Programme tabmult : Affiche les tables de multiplication de de 1 a 10
N_MAX = 10
	.data
barre:	.byte '|'
		.byte 0
espace:	.byte ' '
		.byte 0
tirets:	.asciz "---"
a:		.word 0
b:		.word 0


debutTab:	.skip N_MAX*N_MAX*4		@ adresse du debut du tableau

	.text
	.global main
main: push {lr}

    @ remplissage du tableau
    ldr r0, ptr_debutTab			@ r5 <- ptr_debutTab
    
    @ affichage du tableau
	ldr r0, adr_barre				@ r0 <- adr_barre
    mov r2, #0						@ n_lig <- 0
    mov r3, #0						@ n_col <- 0
    mov r4, #0						@ mult <- 0
    ldr r5, ptr_debutTab			@ r5 <- ptr_debutTab
    
tq:	cmp r2, #N_MAX					@ n_lig - N_MAX ??
	beq fintq
	
	mov r3, #0						@ n_col <- 0
	
tq2:cmp r3, #N_MAX					@ n_col - N_MAX ??
	beq fintq2
	
	ldr r1, adr_barre				@ r1 <- [adr_barre]
	bl EcrChn
	mov r8, #N_MAX*4				@ r8 <- N_MAX*4
	mul r6, r2, r8					@ r6 <- n_lig*r8
	add r7, r5, r6					@ r7 <- ptr_debutTab + r6
	add r7, r7, r3, LSL #2			@ r7 <- r7 + n_col*4
	ldr r4, [r7]					@ mult <- [r7]
	
si:	cmp r4, #100					@ mult - 100 ??
	bge finsi
alors:
	ldr r1, adr_espace				@ r1 <- [adr_barre + 2]
	bl EcrChn
finsi:

si2:cmp r4, #10						@ mult - 10 ??
	bge finsi2
alors2:
	ldr r1, adr_espace				@ r1 <- [adr_barre + 2]
	bl EcrChn
finsi2:

	mov r1, r4
	bl EcrNdecim32
	
	add r3, r3, #1
	b tq2
fintq2:

	ldr r1, adr_barre				@ r1 <- [adr_barre]
	bl EcrChn
	bl AlaLigne
	
	mov r6, #0
tq3:cmp r6, #N_MAX					@ r6 - N_MAX ??
	beq fintq3
	
	ldr r1, adr_barre				@ r1 <- [adr_barre]
	bl EcrChn
	ldr r1, adr_tirets				@ r1 <- [adr_barre + 4]
	bl EcrChn
	
	add r6, r6, #1
	b tq3
fintq3:
	
	ldr r1, adr_barre				@ r1 <- [adr_barre]
	bl EcrChn
	bl AlaLigne
	
    add r2, r2, #1
    b tq
fintq:

fin:pop {lr}
	bx lr

ptr_debutTab:	.word debutTab
ptr_a:			.word a
ptr_b:			.word b
adr_barre:		.word barre
adr_espace:		.word espace
adr_tirets:		.word tirets

	.data
DW:	.word	0
DH:	.hword	0
DB:	.byte	0

	.text
	.global main
main:
	@ word
	@ word @ affiche avant
	LDR r0, LD_DW
	LDR r1, [r0]
	BL EcrHexa32
	BL EcrZdecimal32

	@ word @ range -10
	MOV r4, #-10
	LDR r5, LD_DW
	STR r4, [r5]

	@ word @ affiche apres
	LDR r0, LD_DW
	LDR r1, [r0]
	BL EcrHexa32
	BL EcrZdecimal32


	@ hword
	@ hword @ affiche avant
	LDR r0, LD_DH
	LDR r1, [r0]
	BL EcrHexa16
	BL EcrZdecimal16

	@ hword @ range -10
	MOV r4, #-10
	LDR r5, LD_DH
	STRH r4, [r5]

	@ hword @ affiche apres
	LDR r0, LD_DH
	LDR r1, [r0]
	BL EcrHexa16
	BL EcrZdecimal16


	@ byte
	@ byte @ affiche avant
	LDR r0, LD_DB
	LDR r1, [r0]
	BL EcrHexa8
	BL EcrZdecimal8

	@ byte @ range -10
	MOV r4, #-10
	LDR r5, LD_DB
	STRB r4, [r5]

	@ byte @ affiche apres
	LDR r0, LD_DB
	LDR r1, [r0]
	BL EcrHexa8
	BL EcrZdecimal8

fin:	B exit

LD_DW:	.word	DW
LD_DH:	.word	DH
LD_DB:	.word	DB


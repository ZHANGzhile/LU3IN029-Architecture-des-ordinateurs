.data
	val : .word 50
	tab : .word 1,1,45,14,1919,810,-1
.text
	lui $8, 0x1001
	addiu $9, $8, 4
	xor $15, $15, $15
while:
	lw $10, 0($8)
	lw $12, 0($9)
	addiu $9, $9, 4
	bltz $12, fin #woyaozhengyiju commentaire
	slt $11, $12, $10
	beq $0, $11, skip
	addiu $15, $15, 1
skip:
	j while
fin:
	or $4, $0, $15
	ori $2, $0, 1
	syscall
	ori $2, $0, 10
	syscall
	
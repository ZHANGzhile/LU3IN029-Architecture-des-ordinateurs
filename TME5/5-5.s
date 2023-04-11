.data
	val : .word 3
.text
	lui $8, 0x1001
	addiu $9, $8, 4
	xor $15, $15, $15
while:
	lbu $10, 0($8)
	beq $8, $9, fin #woyaozhengyiju commentaire
	#
while2:
	beq $10, $0, endwhile2  
	andi $11, $10, 1
	beq $11, $0, if0
	addiu $15, $15, 1
if0:
	srl $10, $10, 1 #
	j while2
endwhile2:
	#
	addiu $8, $8, 1
	j while
fin:
	or $4, $0, $15
	ori $2, $0, 1
	syscall
	ori $2, $0, 10
	syscall
	
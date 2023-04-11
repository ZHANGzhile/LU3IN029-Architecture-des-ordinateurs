.data
	v1: .word -1
	v2: .word 0xFF
.text
	lui $7, 0x1001
	lw $8, 0($7)
	lw $9, 4($7)
	addiu $8, $8, 1
	sw $8, 4($7)
	
	
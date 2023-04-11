.data
	tab: .word 4, 23, 12, 3, 8, 1
	chang: .space 4
	tiao: .space 4
.text
	lui $8, 0x1001
	lw $9, 12($8)
	lw $10, 16($8)
	sw $9, 24($8) 
	sw $10, 28($8) 
	
	addiu $11, $9, 1
	sw $11, 0($8)
	
	addu $11, $9, $10
	sw $11, 4($8)
	
	lw $12, 20($8)
	sw $12, 8($8)
	
	ori $2, $0, 10
	syscall
	
	

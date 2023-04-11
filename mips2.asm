.data 
a: .word 5
b: .word 9
   .align 2
c: .space 4

.text

	lui $8, 0x1001
	lw $9, 0($8)
	lw $10, 4($8)
	addu $9, $9, $10
	sw $9, 8($8)
	ori $2, $0, 10
	syscall
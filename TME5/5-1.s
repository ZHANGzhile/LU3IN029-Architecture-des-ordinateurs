.data
	p : .space 4
	q : .space 4
.text
	ori $2, $0, 5
	syscall
	lui $9, 0x1001
	or $8, $2, $0
	ori $2, $0, 5
	syscall
	or $10, $2, $0
	slt $11, $10, $8
	bne $11, $0, skip
	xor $12, $12, $12
while:
	addu $12, $12, $8
	addi $8, $8, 1
	bne $8, $10, while
skip:
	or $4, $0, $12
	ori $2, $0, 1
	syscall
	ori $2, $0, 10
	syscall
	
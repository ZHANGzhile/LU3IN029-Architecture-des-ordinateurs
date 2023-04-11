.data
	a0 : .space 4
	b0 : .space 4
.text
	ori $2, $0, 5
	syscall
	lui $9, 0x1001
	or $8, $2, $0
	ori $2, $0, 5
	syscall
	or $10, $2, $0
	
while:
	beq $8, $10, fin
	sgt $11, $8, $10
	beq $0, $11, skip1
	subu $8, $8, $10
	j skip2
skip1:
	subu, $10, $10, $8
skip2:
	j while
fin:
	or $4, $0, $10
	ori $2, $0, 1
	syscall
	ori $2, $0, 10
	syscall
.data
.text
	addi $12, $18, 33
	addu $0, $18, $12
	
	ori $8, $0, 137
	ori $2, $0, 1
	or $4, $0, $8
	syscall
	
	addi $8, $0, 65537

	or $4, $0, $8
	syscall
	
	addi $8, $0, 84
	addi $9, $0, 10
	div $8, $9
	mflo $11
	mfhi $12
	
	mult $11, $9
	mflo $13
	add $13, $13, $12 
	
	ori $2, $0, 5
	syscall
	add $5, $2, $13
	
	lui $3, 0xAABB
	ori $3, $3, 0xCCDD
	addi $2, $0, 34
	add $4, $0, $3
	syscall
	
	

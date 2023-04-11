.data
	p:.word 3
	m:.word 5
.text
main:
	addiu $29, $29, -8
	lui $8, 0x1001
	lw $4, 0($8) #$4 <- p
	lw $5, 4($8) #$5 <- m
	jal puissance
	
	#print
	ori $4, $2, 0
	ori $2, $0, 1
	syscall
	
	addiu $29, $29, 8
	ori $2, $0, 10
	syscall
	
puissance:
	addiu $29, $29, -16
	sw $31, 12($29)
	sw $4, 16($29)
	sw $5, 20($29)

if1:
	bne $5, $0, if2  
	ori $2, $0, 1
	j finif1
if2:	
	addiu $6, $5, -1
	bne $6, $0, else1
	ori $2, $4, 0
	j finif1
else1:
	ori $6, $0, 2
	div $5, $6
	mflo $5
	jal puissance
	sw $2, 8($29)
	
if3:
	lw $9, 16($29) # $9 <- x
	lw $10, 20($29) # $10 <- n
	andi $6, $10, 0x01
	addiu $6, $6, -1
	bne $6, $0, else2
	mult $2, $2
	mflo $2
	mult $9, $2
	mflo $2
	j finif1
else2:
	mult $2, $2
	mflo $2
finif1:
	lw $31, 12($29)
	addiu $29, $29, 16
	jr $31
	
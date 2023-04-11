.data
	p:.word 5
.text
main:
	addiu $29, $29, -4
	lui $8, 0x1001
	lw $4, 0($8) #paramètre p
	jal fact
	ori $4, $2, 0
	ori $2, $0, 1
	syscall
	addiu $29, $29, 4
	ori $2, $0, 10
	syscall
fact:
	#protologue
	addiu $29, $29, -8
	sw $31, 4($29)
	sw $4, 8($29)
	bne $0, $4, else
	ori $2, $0, 1
	j fin_if
else:
	addiu $4, $4, -1
	jal fact #fuckt(n-1)
	ori $5, $2, 0 #get return
	lw $6, 8($29)
	mult $5, $6
	mflo $2
fin_if:
	lw $31, 4($29)
	addiu $29, $29, 8
	jr $31
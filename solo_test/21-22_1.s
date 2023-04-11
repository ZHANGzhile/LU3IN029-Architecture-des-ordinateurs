.data
	user_sum: .space 4
	tab_chiffire: .space 40
.text
main:
	addiu $29,$29,-12
	ori $2,$0,5
	syscall
	lui $8,0x1001
	sw $2, 0($8)
	lw $4, 0($8)
	addiu $8,$8,4
	ori $5,$8,0
	jal occ_num_chiffre
	
	ori $4,$2,0
	ori $2,$0,1
	syscall
	
	addiu $29,$29,12
	ori $2, $0,10
	syscall
	
occ_num_chiffre:
	addiu $29,$29,-20
	sw $31,16($29)
	sw $16, 12($29)
	ori $16,$0,1
	addu $9,$0,$4 #q
while:
	sltiu $10,$9,10
	bne $10,$0, fin_while
	ori $11, $0, 10
	divu $9,$11
	mfhi $12 #r
	mflo $9 #q
	sll $13,$12,2
	addu $13,$13,$5
	lw $14,0($13)
	addiu $14,$14,1
	sw $14,0($13)
	addiu $16,$16,1
	j while
	
fin_while:
	sll $15,$9,2
	addu $15,$15,$5
	lw $7,0($15)
	addiu $7,$7,1
	sw $7,0($15)
	ori $2,$16,0
	lw $31,16($29)
	lw $16, 12($29)
	jr $31
	
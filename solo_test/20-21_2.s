.data
	s: .space 20
	ch_ok: .asciiz "bien parenthésé\n"
	ch_nok: .asciiz "mal parenthésé\n"
.text
main:
	addiu $29,$29,-12
	lui $4,0x1001
	ori $5,$0,20
	ori $2,$0,8
	syscall
	
	lui $4,0x1001
	ori $2,$0,4
	syscall
	
	lui $4,0x1001
	jal bon_parenthesage
	ori $16,$2,0
if_ok:
	bne $16,$0,else_ok
	lui $4,0x1001
	addiu $4,$4,20
	ori $2,$0,4
	syscall
	j fin_if_ok
else_ok:
	lui $4,0x1001
	addiu $4,$4,37
	ori $2,$0,4
	syscall
fin_if_ok:
	lui $4,0x1001
	ori $5,$0,0
	jal bon_parenthesage_rec
	ori $16,$2,0
if2_ok:
	bne $16,$0,else2_ok
	lui $4,0x1001
	addiu $4,$4,20
	ori $2,$0,4
	syscall
	j fin_main
else2_ok:
	lui $4,0x1001
	addiu $4,$4,37
	ori $2,$0,4
	syscall	
fin_main:
	addiu $29,$29,12
	ori $2,$0,10
	syscall

bon_parenthesage:
	addiu $29,$29,-12
	sw $31,8($29)
	ori $2,$0,0 #d
	ori $8,$0,0 #i
	#ori $9, $0,'/0'
	ori $10, $0,'('
	ori $11,$0,')'
	
while:
	addu $12,$8,$4
	lbu $13,0($12)
	beq $13,$0,fin_while
if1:
	bne $13,$10,if2
	addiu $2,$2,1
	j if3
if2:
	bne $13,$11,if3
	addiu $2,$2,-1
	j if3
if3:
	bltz $2,fin_while
	#j fin_while
fin_if:
	addiu $8,$8,1
	j while
fin_while:
	sw $31,8($29)
	addiu $29,$29,12
	jr $31

bon_parenthesage_rec:
	addiu $29,$29,-20
	sw $31,16($29)
	sw $16,12($29)
	sw $4,20($29)
	sw $5,24($29)
	ori $10, $0,'('
	ori $11,$0,')'
	
if5:
	addu $8,$5,$4
	lbu $16,0($8)
	bne $16,$0, fin_if5
	ori $2,$0,0
	j fin_bon
fin_if5:
	lw $4, 20($29)
	lw $5,24($29)
	addiu $5,$5,1
	jal bon_parenthesage_rec
if6:
	bgtz $2,fin_bon
if7:
	bne $16,$10,if8
	addiu $2,$2,1
	j fin_bon
if8:
	bne $16,$11,fin_bon
	addiu $2,$2,1
	j fin_bon
fin_bon:
	lw $31,16($29)
	lw $16,12($29)
	addiu $29,$29,20
	jr $31
	
	

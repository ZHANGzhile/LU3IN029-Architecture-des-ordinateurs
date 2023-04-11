.data
	s: .space 20
	ch_ok: .asciiz "bien parenthésé\n"
	ch_nok: .asciiz "mal parenthésé\n"
.text
main:
	addiu $29,$29,-8
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
if:
	bne $16,$0,else
	lui $4,0x1001
	addiu $4,$4,20
	ori $2,$0,4
	syscall
	j fin_main
else:
	lui $4,0x1001
	addiu $4,$4,37
	ori $2,$0,4
	syscall
fin_main:
	addiu $29,$29,8
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
	
	
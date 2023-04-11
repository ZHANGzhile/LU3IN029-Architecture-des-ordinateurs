.data
	chaine: .space 11
.text
	#pos $7, i $8, nb $9, r $10, nbzero $11, ten $12, calculate $13
	addiu $29, $29, -16
	lui $7, 0x1001
	ori $2, $0, 5
	syscall
	or $9, $0, $2
	sb $0, 10($7)
	ori $12, $12, 10
	#main
	ori $8, $0, 9  #i
	sw $8, 0($29) 
	addiu $7, $7, 9
for:
	bltz $8, Finfor
	div $9, $12  #r = nb % 10
     	mfhi $13
     	sw $13, 8($29) #r
     	mflo $9
     	sw $9, 4($29) #nb
	addi $13, $13, 0x30
	
	sb $13, 0($7) #chaine[i] = r + 0x30
	addiu $7, $7, -1
	addiu $8, $8, -1
	j for
Finfor:
	ori $2, $0, 4
	lui $7, 0x1001
	or $4, $0, $7  #print chaine
	syscall
	
	sw $0, 12($29) #ecrit nbzero=0 dans la pile
	sw $0, 0($29) #ecrit i=0 dans la pile
	ori $25, $25, 0x30 #$25 = '0'

while:
	#$14 condition de i < 9, 
	lw $8, 0($29) #i
	slti $14, $8, 10 #$14=1 si $8 < 10
	beq $14, $0, fin
	
	addu $7, $7, $8
	lb $15, 0($7)
	lui $7, 0x1001
	bne $15, $25, else #if $15 condition de ch[i] == 0x30

	lw $11, 12($29)    
	addiu $11, $11, 1   #nbzero ++
	sw $11, 12($29)
	
	addiu $8, $8, 1    #i++
	sw $8, 0($29)	
	
	j while	
	
else:
	addiu $8, $8, 1    #i++
	sw $8, 0($29)	
	
	j while	

fin:	
	lw $11, 12($29)
	ori $2, $0, 1
	or $4, $11, $0
	syscall #print nbzero
	ori $2, $0, 10
	syscall

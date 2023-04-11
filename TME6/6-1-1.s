.data
	chaine: .space 11
.text
	#pos $7, i $8, nb $9, r $10, nbzero $11, ten $12, calculate $13
	lui $7, 0x1001
	ori $2, $0, 5
	syscall
	or $9, $0, $2
	sb $0, 10($7)
	ori $12, $12, 10
	#main
	ori $8, $0, 9  #i
	addiu $7, $7, 9
Boucle:
	bltz $8, Fin
	div $9, $12  #r = nb % 10
     	mfhi $13
     	mflo $9
	addi $13, $13, 0x30
	
	sb $13, 0($7) #chaine[i] = r + 0x30
	addiu $7, $7, -1
	addiu $8, $8, -1
	j Boucle
Fin:
	ori $2, $0, 4
	lui $7, 0x1001
	or $4, $0, $7
	syscall
	ori $2, $0, 10
	syscall
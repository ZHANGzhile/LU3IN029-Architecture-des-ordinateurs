.data
	chaine : .asciiz "duideduidebuduibudui"
.text
	lui $8, 0x1001
	xor $10, $10, $10
while:
	lb $9, 0($8)
	beq $0, $9, runle
	addiu $8, $8, 1
	addiu $10, $10, 1
	j while
runle: 
	or $4, $0, $10
	ori $2, $0, 1
	syscall
	ori $2, $0, 10
	syscall
	
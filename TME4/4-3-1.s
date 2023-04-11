.data
	ch: .asciiz "coucou"
	ch2: .asciiz "bonjour"
	
.text
	lui $8, 0x1001
	lw $9, 0($8)

	or $4,$0,$8
	ori $2, $0, 4
	syscall
	
	ori $2, $0,11
	ori $4, $0, 0x0A
	#syscall
		
	lb $10, 0($8)
	lb $11, 1($8)
	sb $10, 1($8)
	sb $11, 0($8)
	
	lw $9, 0($8)
	la $a0, ch
	ori $2, $0, 4
	#syscall
	
	ori $2, $0, 10
	syscall
		
	

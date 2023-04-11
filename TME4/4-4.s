.data
	ch: .asciiz "123456"
	tab: .word 31,32,33,34,35,36

.text
	lui $8, 0x1001
	lb $9, 0($8)
	
	ori $2, $0, 11
	or $4, $0, $9
	#syscall
	
	
	lb $16, 2($8)
	ori $2, $0, 1
	or $4, $0, $16
	#syscall
	
	ori $2, $0, 11
	or $4, $0, $16
	#syscall
	
	ori $2, $0, 10
	syscall
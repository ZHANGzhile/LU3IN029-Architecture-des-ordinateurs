.data
	ch1: .ascii "Bonjour \n"
	b: .byte 257
	
	
.text
	lui $10, 0x1001
	lhu, $8,16($10)
	lh, $9, 18($10) 
	lb $4, 4($10)
	ori $2, $0 ,11
	syscall

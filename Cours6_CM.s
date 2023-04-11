.data
str: .asciiz "helloworld"
.text
# Prologue du main
	addiu $29, $29, -4 # 1 variable locale : i 
	sw $0, 0($29) # i = 0
          
# Corps du main
loop:
# Condition de la boucle while
	lui $8, 0x1001 # $8 = 0x10010000 = @str
	lw $9, 0($29) # lecture i
	addu $9, $8, $9 # $9 = &str[i] = @str + i
	lb $9, 0($9) # $9 = str[i]
	beq $9, $0, finloop # test str[i] == 0
	# lecture str[i]
        lui $8, 0x1001 # $8 = 0x10010000 = @str
	lw $9, 0($29) # lecture i
	addu $9, $8, $9 # $9 = &str[i] = @str + i
	lb $9, 0($9) # $9 = str[i]
	addiu $9, $9, -0x20 # str[i] - 0x20




           # écriture str[i]
	lui $8, 0x1001  # $8 = 0x10010000 = @str
	lw $10, 0($29)    # lecture i
	addu $10, $8, $10  # $10 = &str[i] = @str + i
	sb $9, 0($10)  # écriture str[i]
	#i=i+1
	lw $9, 0($29) # lecture i
	addiu $9, $9, 1  # i + 1
	sw $9, 0($29) # écriture i
# Retour au début de la boucle
	 j loop
    
finloop:
# Epilogue du main 
	addiu $29, $29, 4 # Désallocation dans la pile
	ori $2, $0, 10 
	syscall

# exit


	
	
	

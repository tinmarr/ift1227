.data
entered: .asciiz "La donnée est déjà entrée! Entrez une autre valeur de 1 à 16.\n"
notValid: .asciiz "Le nombre entré n'est pas valide. Entrez une valeur de 1 à 16.\n"
tabChar: .asciiz "\t"
newLineChar: .asciiz "\n"
magique: .asciiz "La matrice n'est pas un carré magique!"
pasMagique: .ascizz "Carré magique !!! La valeur magique est: "
verif: .word 0, 0, 0, 0 # tableau de verification de l'entrer (16 bytes)
.text
main: 
	lui $a0, 0x1004
	li $a1, 4
	li $a2, 4
	jal creerMat
	
	lui $a0, 0x1004
	li $a1, 4
	li $a2, 4
	jal afficherMat
	# exit cleanly
	li $v0, 10
	syscall
printNotValid:
	# print(notValid)
	li $v0, 4
	la $a0, notValid
	syscall
	j inputLoop
printEntered:
	# print(entered)
	li $v0, 4
	la $a0, entered
	syscall
	j inputLoop
creerMat:
	# save arguments to registers
	move $t7, $a0 # starting address
	mul $t6, $a1, $a2 # dimensions (size)
	# init for loop counter
	li $t0, 0
	inputFor:
		# read int into $v0
		li $v0, 5
		syscall
		# if gt 16 or le 0 try again
		bgt $v0, $t6, printNotValid
		ble $v0, 0, printNotValid
		# Check the verif list
		addiu $t2, $v0, -1
		lb $t1, verif($t2) # load value from the verif array
		bnez $t1, printEntered # Check if we have used this number yet
		li $t1, 1
		sb $t1, verif($t2) # Save that we have used the number (set addr in verif array to 1)
		# Number is good to add to heap!
		sll $t1, $t0, 2 # heap offset
		add $t1, $t1, $t7 # add offset to starting address
		sw $v0, 0($t1) # save to address
		# $t0-- and loop if != 0f
		addiu $t0, $t0, 1
		inputLoop: blt, $t0, $t6, inputFor
	# Calculate next available address in the heap 
	sll $t0, $t0, 2
	add $v0, $t7, $t0
	jr $ra
printNumber: # printNumber(number: int, newLine: bool)
	li $v0, 1
	syscall
	la $a0, tabChar
	li $v0, 4
	syscall
	beqz $a1, pNReturn
	la $a0, newLineChar
	li $v0, 4
	syscall
	pNReturn: j pNReturnTo
afficherMat:
	# save arguments to registers
	move $t0, $a0 # starting address
	move $t1, $a1 # num rows
	move $t2, $a2 # num cols
	# init loop counters
	li $t3, 0 # row counter (i)
	li $t4, 0 # col counter (j)
	afficherLoop:
		# get number to display
		# offset calculation
		mul $t5, $t3, $t2 
		add $t5, $t5, $t4
		sll $t5, $t5, 2
		add $t5, $t5, $t0 # addr of number in heap
		lw $a0, 0($t5) # get number
		addi $t4, $t4, 1
		li $a1, 0
		bne $t4, $t2, notEndOfRow
		li $t4, 0
		addi $t3, $t3, 1
		li $a1, 1
		notEndOfRow: j printNumber
		pNReturnTo: beq $t3, $t1, affichReturn
		j afficherLoop
	affichReturn: jr $ra
sumRow: # sumRow(matAddr, rowNumber)
sumCol: # sumCol(matAddr, colNumber)
sumDiagLR: # sumDiagLR(matAddr)
sumDiagRL: # sumDiagRL(matAddr)
estMagique:
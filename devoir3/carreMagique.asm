# Carré Magique
# Demande l'entrée d'un carré 4x4 puis te dis si c'est un carré magique.
# Date: 26 mars 2024
# Auteurs: Martin Chaperot (20205638) et Hamza Ali Ousalah (20249230)
# Addresse Courriel: martin.chaperot@umontreal.ca et hamza.ali.ousalah@umontreal.ca
.data
entered: .asciiz "La donnée est déjà entrée! Entrez une autre valeur de 1 à 16.\n"
notValid: .asciiz "Le nombre entré n'est pas valide. Entrez une valeur de 1 à 16.\n"
tabChar: .asciiz "\t"
newLineChar: .asciiz "\n"
pasMagique: .asciiz "La matrice n'est pas un carré magique!"
magique: .asciiz "Carré magique !!! La valeur magique est: "
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
	
	lui $a0, 0x1004
	li $a1, 4
	li $a2, 4
	jal estMagique
	move $t1, $v0
	# print magique
	li $v0, 4
	la $a0, magique
	syscall
	# print number
	li $v0, 1
	move $a0, $t1
	syscall
	# exit
	li $v0, 10
	syscall
	# pas magique
	pasMagiqueConfirm: li $v0, 4
	la $a0, pasMagique
	syscall
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
sumRow: # sumRow(matAddr, nRows, nCols, rowNumber)
	li $v0, 0 # sum
	li $t0, 0 # j
	srloop:
		# offset calc
		mul $t1, $a3, $a1
		add $t1, $t1, $t0
		sll $t1, $t1, 2
		add $t1, $t1, $a0 # addr of number
		lw $t1, 0($t1) # number
		add $v0, $v0, $t1
		addi $t0, $t0, 1
		bne $t0, $a2, srloop
	jr $ra
sumCol: # sumCol(matAddr, nRows, nCols, colNumber)
	li $v0, 0 # sum
	li $t0, 0 # i
	scloop:
		# offset calc
		mul $t1, $t0, $a1
		add $t1, $t1, $a3
		sll $t1, $t1, 2
		add $t1, $t1, $a0 # addr of number
		lw $t1, 0($t1) # number
		add $v0, $v0, $t1
		addi $t0, $t0, 1
		bne $t0, $a1, scloop
	jr $ra
sumDiagLR: # sumDiagLR(matAddr, nRows, nCols)
	li $v0, 0 # sum
	li $t0, 0 # i
	li $t1, 0 # j
	sdlrLoop:
		# offset calc
		mul $t2, $t0, $a2
		add $t2, $t2, $t1
		sll $t2, $t2, 2
		add $t2, $a0, $t2 # addr of num
		lw $t2, 0($t2) # num
		add $v0, $v0, $t2
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		bne $t0, $a1, sdlrLoop
		bne $t1, $a2, sdlrLoop
	jr $ra
sumDiagRL: # sumDiagRL(matAddr, nRows, nCols)
	li $v0, 0 # sum
	li $t0, 0 # i
	addi $t1, $a2, -1 # j
	sdrlLoop:
		# offset calc
		mul $t2, $t0, $a2
		add $t2, $t2, $t1
		sll $t2, $t2, 2
		add $t2, $a0, $t2 # addr of num
		lw $t2, 0($t2) # num
		add $v0, $v0, $t2
		addi $t0, $t0, 1
		addi $t1, $t1, -1
		bne $t0, $a1, sdrlLoop
		bne $t1, -1, sdrlLoop
	jr $ra
sumCoin: # sumCoin(matAddr, nRows, nCols)
	li $v0, 0 # sum
	# top left 
	lw $t1, 0($a0)
	add $v0, $v0, $t1
	# top right
	add $t1, $a1, -1
	sll $t1, $t1, 2
	add $t1, $a0, $t1
	lw $t1, 0($t1)
	add $v0, $v0, $t1
	# bottom right
	mul $t1, $a1, $a2
	addi $t1, $t1, -1
	sll $t2, $t1, 2
	add $t2, $a0, $t2
	lw $t2, 0($t2)
	add $v0, $v0, $t2
	# bottom left
	addi $t2, $a2, -1
	sub $t1, $t1, $t2
	sll $t1, $t1, 2
	add $t1, $a0, $t1
	lw $t1, 0($t1)
	add $v0, $v0, $t1
	# return
	jr $ra
estMagique: # estMagique(matAddr, nRows, nCols)
	move $t9, $ra
	jal sumCoin
	move $t8, $v0
	jal sumDiagLR
	bne $v0, $t8, pasMagiqueConfirm
	jal sumDiagRL
	bne $v0, $t8, pasMagiqueConfirm
	li $a3, 0
	rowColCalcLoop:
		jal sumRow
		bne $v0, $t8, pasMagiqueConfirm
		jal sumCol
		bne $v0, $t8, pasMagiqueConfirm
		addi $a3, $a3, 1
		bne $a3, $a1, rowColCalcLoop
		bne $a3, $a2, rowColCalcLoop
	jr $t9

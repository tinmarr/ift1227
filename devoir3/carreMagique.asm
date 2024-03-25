.data
entered: .asciiz "La donnée est déjà entrée! Entrez une autre valeur de 1 à 16.\n"
notValid: .asciiz "Le nombre entré n'est pas valide. Entrez une valeur de 1 à 16.\n"
verif: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # tableau de verification de l'entrer
.text
main: 
	jal creerMat
	li $v0, 10
	syscall
creerMat:
	# init for loop counter
	li $t0, 0
	inputFor:
		# read int into $v0
		li $v0, 5
		syscall
		# if gt 16 or le 0 try again
		bgt $v0, 16, printNotValid
		ble $v0, 0, printNotValid
		# Check the verif list
		li $t1, 4 # word spacing
		addiu $t2, $v0, -1
		mul $t2, $t2, $t1 # addr of num in verif array ($t2)
		lw $t1, verif($t2) # load value from the verif array
		bnez $t1, printEntered # Check if we have used this number yet
		li $t1, 1
		sw $t1, verif($t2) # Save that we have used the number (set addr in verif array to 1)
		# Number is good to add to heap!
		
		# $t0-- and loop if != 0
		addiu $t0, $t0, 1
		inputLoop: blt, $t0, 16, inputFor
	jr $ra
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
			.data

vett1:		.word 1, 2, 3, 4
vett2:		.word 5, 10, 20, 40
res:		.space 16

			.text
			.globl main
			
#Starting Main
main:
	addi $s0, $0, 4
	addi $s1, $0, 0
	addi $s2, $0, 15
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	
loop:
	jal multiplyAndStore
	beq $t8, $s0, switchIJ
	beq $s1, $s2, closeProgram
	addi $t8, $t8, 1
	addi $s1, $s1, 1
	j loop
	
switchIJ:
	and $t8, $t8, $zero
	addi $t9, $t9, 1
	j loop
	
closeProgram:
	li $v0, 10
	syscall
	
multiplyAndStore:
	la $t0, res
	sll $t1, $s1, 2
	add $t0, $t0, $t1 # t0 -> Dove Salvare
#################
	la $t1, vett1	# Carico vett1
	sll $t3, $t8, 2	
	add $t1, $t1, $t3 
	lw $t1, ($t1) # t1 = vett1[t8]
#################
	la $t2, vett2
	sll $t3, $t9, 2
	add $t2, $t2, $t3
	lw $t2, ($t2) # t2 = vett[t9]
################
    mul $t3, $t1, $t2 #t3 = t1 * t2
	sw $t3, ($t0) # salvo in res[t8][t9] =  t3
################
	jr $ra
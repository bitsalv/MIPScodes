.data
primoNumero:    .asciz "Inserisci un intero: "
secondoNumero:  .asciz "Inserisci un secondo intero: "
.text

.globl main
.ent main

main:

    la $a0, message		#lettura primo numero
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0

    la $a0, message		#lettura secondo numero
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
		
	#scambia $t1 e $t2 senza usare altri registri
	add $t1, $t1, $t2
	sub $t2, $t1, $t2
	sub $t1, $t1, $t2


li $v0, 10
syscall

.end main 
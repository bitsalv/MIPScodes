.data

var: .word 0x3FFFFFF0

.text

.globl main
.ent main

main:

    
   lw $t0,var
   sll $t1,$t0,1 #prima somma
   move $a0,$t1
   li $v0,1
   syscall
     
   addiu $a0,$t1,40 #seconda somma
   li $v0,1
   syscall

   #addi $a0, $t1, 40
   #li $v0,1
   #syscall
   #scatena l'accezione di overflow

    li $t2,40 #terza somma
    addu $a0, $t1, $t2
    li $v0, 1
    syscall


    #scatena l'eccezione di overflow
    #add $a0, $t1, $t2
    #li $v0, 1
    #syscall


li $v0, 10
syscall

.end main 
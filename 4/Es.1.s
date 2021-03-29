.data
fibonacci: .space 40
.text
.globl main
.ent main

main:
    move $t1, $0  #contatore

loop:
    addi $t1,$t1,1

    sll $t2,$t1,2
    sll $t3,$t1,3

    

    bne $t1, 20, loop





li $v0, 10
 syscall
.end main

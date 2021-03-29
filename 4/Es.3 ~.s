.data
vettore1: .word 1, 2, 3, 4
vettore2: .word 4, 5, 6, 7
matrice: .space 16
.text
.globl main
.ent main



main:

move $t0, $0 #contatore ciclo esterno   
lw $t2, vettore1
lw $t3, vettore2

loop1:
    move $t1, $0 #contatore ciclo interno
    sll $t4,$t0,2
    lw $t5,vettore1($t4)
loop2:
    sll $t6,$t1,2
    lw $t7,vettore2($t6)

    mul $s0, $t5, $t7 
    sw $s0, matrice($t6)

    move $a0, $s0          #stampa elemento matrice 
    li $v0, 1
    syscall
    addi $t1, $t1, 1    #conto internamente
    bne $t1, 4, loop2

    addi $t0, $t0, 1    #conto esternamente 
    bne $t0, 4, loop1 





li $v0, 10
syscall 
.end main
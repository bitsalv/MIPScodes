.data
DIM=3
messageIn: .asciiz "Inserire numeri: "
messageOut: .asciiz "Media: "

.text
.globl main
.ent main

main:
    and $t0, $0, $0 #contatore
    and $t1, $0, $0 #accumulatore

    la $a0, messageIn
    li $v0, 4
    syscall

loop: li $v0, 5 #legge interi
      syscall

      add $t1, $t1, $v0
      addiu $t0, $t0, 1
      bne $t0, DIM, loop
      
    la $a0, messageOut
    li $v0, 4
    syscall

    div $t1, $t1, DIM

    li $v0, 1
    move $a0, $t1
    syscall


    

li $v0, 10
 syscall
.end main

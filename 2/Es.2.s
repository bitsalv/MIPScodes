.data
err_mess: .asciiz "Introdurre valori compresi tra -127 e 128"
.text
.globl main
.ent main

main:

    li $v0, 5
    syscall
    li $t1, 0xFFFFFF00
    syscall
    and $t0, $v0, $t1  #A sta in $t0
    bne $t0,0, errore

    li $v0, 5
    syscall
    and $t1,$v0,$t1   #B sta in $t1
    bne $t1,0,errore 

    not $t3, $t1
    and $t3, $t0, $t3
    not $t3, $t3
    xor $t0,$t0,$t1
    or $t0, $t0, $t3

    li $t1, 0x000000FF
    and $t0,$t0,$t1
    move $a0, $t0
    li $v0, 1
    syscall

j fine

errore: la $a0, err_mess
        li $v0, 4
        syscall


fine:    li $v0, 10
        syscall
        .end main

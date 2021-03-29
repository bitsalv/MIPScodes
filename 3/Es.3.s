.data
giorni: .byte 231
ore: .byte 16
minuti: .byte 47
risultato: .space 4

.text
.globl main
.ent main

main:
    lbu $t0, giorni
    mul $t1, $t0, 24
    lbu $t0, ore
    addu $t1, $t1, $t0
    lbu $t0, minuti
    addu $t1,$t1,$t0
    sw $t1, risultato
    

li $v0, 10
 syscall
.end main

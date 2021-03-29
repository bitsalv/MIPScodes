.data
operazioni: .word addizione, sottrazione, moltiplicazione, divisione, uscita
opa: .word 2043
opb: .word 5
res: .word 0
messageInput: .asciiz "Inserisci 0 per sommare, 1 per sottrarre, 2 per moltiplicare, 3 per dividere, 4 per uscire"
messageOutput: .asciiz "Il risultato e': "
.text
.globl main
.ent main

main: 
loop:
    li $t1, 4
    lw $t2, opa
    lw $t3, opb
    la $a0, messageInput
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t1, $v0
    sll $t1, $t1, 2
    lw $t0, operazioni($t1)
    jr $t0

addizione:
    add $t4,$t2,$t3
    sw $t4,res
    la $a0,messageOutput
    li $v0,4
    syscall
    move $a0,$t4
	li $v0, 1
    syscall

    j loop

sottrazione:
    sub $t4,$t2,$t3
    sw $t4,res
    la $a0,messageOutput
    li $v0,4
    syscall
    move $a0,$t4
	li $v0, 1
    syscall

    j loop

moltiplicazione:
    mul $t4,$t2,$t3
    sw $t4,res
    la $a0,messageOutput
    li $v0, 4
    syscall
    move $a0,$t4
	li $v0, 1
    syscall

    j loop

divisione:
    div $t4,$t2,$t3
    sw $t4,res
    la $a0,messageOutput
    li $v0,4
    syscall
    move $a0,$t4
	li $v0, 1
    syscall

    j loop

uscita:

li $v0, 10
 syscall
.end main

.data
messageInput: .asciiz "Inserisci un numero: "
messageError: .asciiz "\nIl numero inserito non è valido"
messageOk: .asciiz "Numero inserito valido!"
messageEmpty: .asciiz "Non è stato inserito nessun numero!"
messageOverflow: .asciiz "Numero troppo grande"
ZERO= 0-'0'
.text
.globl main
.ent main

main:
        la $a0, messageInput
        li $v0, 4
        syscall
        move $t0, $0 #contatore numeri letti
        move $t1, $0 #accumulatore
        li $t3, 10
loop:
        li $v0, 12 #lettura carattere
        syscall

        beq $v0, '\n', exitLoop #uscita
        blt $v0, '0', notANumber #compreso tra 0 
        bgt $v0, '9', notANumber #e 9 
        addi $t0,$t0,1 #contatore

        multu $t1, $t3
        mfhi $t1
        bne $t1, $0, overflow
        mflo $t1 

        addi $t2, $v0, ZERO
        add $t2, $t1, $t2
        bltu $t2, $t1, overflow
        move $t1, $t2

    
        j loop

exitLoop: beq $t0,0,noInput
          la $a0, messageOk
          li $v0, 4
          syscall
          li $v0, 1
          move $a0, $t1
          syscall
          j endProgram

noInput:  la $a0, messageEmpty
          j printMessage

notANumber: la $a0, messageError
            j printMessage
            
overflow: la $a0, messageOverflow

printMessage: li $v0, 4
              syscall




endProgram:

li $v0, 10
 syscall
.end main

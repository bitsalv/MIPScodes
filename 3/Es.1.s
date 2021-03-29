.data
messageInput: .asciiz "Inserisci un numero: "
messageError: .asciiz "\nIl numero inserito non è valido"
messageOk: .asciiz "Numero inserito valido!"
messageEmpty: .asciiz "Non è stato inserito nessun numero!"
.text
.globl main
.ent main

main:
        la $a0, messageInput
        li $v0, 4
        syscall
        move $t0, $0 #contatore numeri letti
loop:
        li $v0, 12 #lettura carattere
        syscall
        beq $v0, '\n', exitLoop #uscita
        blt $v0, '0', notANumber #compreso tra 0 
        bgt $v0, '9', notANumber #e 9 
        addi $t0,$t0,1 #contatore
        j loop

exitLoop: beq $t0,0,noInput
          la $a0, messageOk
          j printMessage

noInput:  la $a0, messageEmpty
          j printMessage

notANumber: la $a0, messageError

printMessage: li $v0, 4
              syscall

li $v0, 10
 syscall
.end main

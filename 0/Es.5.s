

              .data
    DIM=15
wVett:   .word  2, 5, 16, 12, 34, 7, 20, 11, 31, 44, 70, 69, 2, 4, 23
wResult: .space 4
   
    .text
    .globl main
    .ent main

main:
	
    li $t1, 0     #accumulatore
    li $t3, DIM     #contatore
    la $t0, wVett #vettore

ciclo:  lw  $t2, ($t0)         #carico al temporaneo il valore successivo del vettore   
        add $t1, $t1, $t2     #sommo al totale il valore del vettore appena caricato
        add $t0, $t0, 4      #aumento di posizione nel vettore
        sub $t3, $t3, 1     #aggiorno il contatore
        beq $t3, 0, fine    #vado a loop finché il contatore non è uguale a 16
        j ciclo 
fine:   sw  $t1, wResult


    li $v0, 10
    syscall
    .end main 
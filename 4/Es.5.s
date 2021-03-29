.data
tabella: .word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
.text
.globl main
.ent main

main:

li $s1, 6

#somma sulle righe    

move $t0, $0 #contatore ciclo esterno   

loop1:
    move $t1, $0 #contatore ciclo interno
    
loop2:
    sll $t2,$t1,2
    lw $t3,tabella($t2)

    add $t4, $t4, $t3

    addi $t1, $t1, 1    #conto internamente
    bne $t1, 6, loop2

    sw $t4, tabella($t2) #salva la somma sulla riga finale

    addi $t0, $t0, 1    #conto esternamente 
    bne $t0, 4, loop1 

#fine sommma sulle righe


#somma sulle colonne 


move $t0, $0 #contatore ciclo esterno   

ciclo1:
    move $t1, $0 #contatore ciclo interno
    
ciclo2:
    sll $t2,$t1,2	
    mul $s3, $t2, $s1
    lw $t3,tabella($s3)

    add $t4, $t4, $t3

    addi $t1, $t1, 1    #conto internamente
    bne $t1, 4, ciclo2

    sw $t4, tabella($t2) #salva la somma sulla riga finale

    addi $t0, $t0, 1    #conto esternamente 
    bne $t0, 6, ciclo1 


#fine somma sulle colonne


#stampa tabella finale

move $t0, $0 #contatore ciclo esterno   

giro1:
    move $t1, $0 #contatore ciclo interno
    
giro2:
    sll $t2,$t1,2
    lw $t3,tabella($t2)


    move $a0, $t3
    li $v0, 1
    syscall

    addi $t1, $t1, 1    #conto internamente
    bne $t1, 6, giro2

    sw $t4, tabella($t2) #salva la somma sulla riga finale

    addi $t0, $t0, 1    #conto esternamente 
    bne $t0, 4, giro1 



#fine stampa 




li $v0, 10
syscall 
.end main
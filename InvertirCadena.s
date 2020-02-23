vuelta:
li $t0 0 
li $t1 0 
move $t2 $a0
for1: 
lb $t1 ($t2) 
beqz $t1 seguir #Localizar '\0'

add $t0 $t0 1 
add $t2 $t2 1 
j for1

seguir:
sub $t2 $t2 1 
for2:
bgt $a0 $t2 fin 
lb $t1 ($t2) 
sb $t1 ($a1)
sub $t2 $t2 1 
add $a1 $a1 1 
j for2
fin: 
li $t1 0
sb $t1 ($a1)
jr $ra

imprimir:
li $v0 4
syscall
jr $ra

main:
sw $ra ($sp)
sub $sp $sp 4
la $a0 cadena1
la $a1 cadena2
jal vuelta
la $a0 cadena2
jal imprimir
lw $ra 4($sp)
add $sp $sp 4
jr $ra
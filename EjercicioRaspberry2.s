.data
 cadena: .asciiz �Hola�
.text
 .globl main

main: sub $sp, $sp, 24
sw $ra, 20($sp)
sw $a0, 4($sp)
la $a0, cadena
jal vocales
move $a0, $v0
 li $v0, 1
 syscall
lw $ra, 20($sp)
lw $a0, 4($sp)
addi $sp, $sp, 24

 li $v0, 10
 syscall

vocales: li $t0, -1 
move $t1, $a0
beqz $t1, fin
li $t0, 0
li $t2, �a�
 bucle: lbu $t3, ($t1)
 beqz $t3, fin
bneq $t3, $t2, noA
addi $t0, $t0, 1
 noA: addi $t1, $t1, 1
b bucle
fin: move $v0, $t0
jr $ra
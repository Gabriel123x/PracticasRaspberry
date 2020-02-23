 .data
 msg01: .asciiz "Cantidad de números a leer: "
 msg02: .asciiz "Introducir número: "
 msg03: .asciiz "El resultado es: "
 .text
 main:

 la $a0 msg01
 li $v0 4
 syscall

 li $v0 5
 syscall
 move $t0 $v0

 beqz $t0 f01

 li $t1 0
 li $t2 0
 b01:

 la $a0 msg02
 li $v0 4
 syscall

 li $v0 5
 syscall

 mul $v0 $v0 $v0
 add $t2 $t2 $v0

add $t1 $t1 1
 blt $t1 $t0 b01
 
 la $a0 msg03
 li $v0 4
 syscall

 move $a0 $t2
 li $v0 1
 syscall
f01: li $v0 10
 syscall

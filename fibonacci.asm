.data 
inicial: .word 0
siguiente: .word 1
generado: .word 0
i: .word 0
mensaje: .asciiz "Serie  de Fibonacci: "

.text 
.globl main

main:

lw $t1, inicial # cargar el valor de incicial a $t1
lw $t2, siguiente # cargar el valor de siguiente a $t2
lw $t3, generado # cargar el valor de generado a $t3
lw $t4, i # cargamos i en t4, 


li $v0, 4  # imprimirmos el mensaje 
la $a0, mensaje
syscall

while:
	
	bgt $t4, 10, exit # esta será la condicion para salir del while 
	add $t3, $t1,$t2 # sumamos el número inicial y el siguiente
	
	
	li $v0, 1 # imprimimos por pantalla el número generado 
	move $a0, $t3 
	syscall
	
	move $t1, $t2 #cambiamos los valores de inicial por el siguiente 
	move $t2 ,$t3 # cambiamos los valores de siguiente por generado 
	
	add $t4, $t4 ,1 #i++ incrementamos 
	j while # repetimos el bucle 
exit:

	
#salida del programa 
li $v0, 10
syscall
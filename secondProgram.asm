.data 
num1: .asciiz "Ingrese el primer número: "
num2: .asciiz "Ingrese el segundo número: "
num3: .asciiz "Ingrese el tercer numero: "
resultado: .asciiz "El número menor es: "
.text 
.globl main
main: 
#imprimir el primer mensaje al usuario 
li $v0, 4 # comando para imprimir un string
la $a0, num1 #cargar el mensjae a los argumentos para poder imprimir
syscall #ejecutar el comando 

#leer el primer numero ingresado 
li $v0, 5 #comando para leer un int 
syscall #ejecutar el comando anterior
move $t0, $v0 #mover el numero ingresado al registro $t0

#imprimir el segundo mensaje al usuario 
li $v0, 4 
la $a0, num2
syscall
# leer el segundo número 
li $v0, 5
syscall
move $t1, $v0

#imprimir el tercer mensaje al usuario 
li $v0, 4
la $a0, num3
syscall
#leer el tercer número 
li $v0, 5
syscall
move $t2, $v0

#Logica para encontrar el número menor 
move $t3, $t0  #tomamos t0 como si fuera el valor menor 
ble $t3,$t1, numeroMenor # evaluamos si t3 es menor a t1
move $t3, $t1 # de ser menor t1 actualizamos el número menor 
numeroMenor:
ble $t3 $t2, imprimir #evaluamos si t3 es menor a t2 de ser asi se imprime 
move $t3, $t2 # de ser menor t2 se actualiza el valor menor 

imprimir:
li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $t3
syscall

#salida del programa 
li $v0, 10
syscall

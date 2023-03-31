.data 
num1: .asciiz "Ingrese el primer número: "
num2: .asciiz "Ingrese el segundo número: "
num3: .asciiz "Ingrese el tercer numero: "
resultado: .asciiz "El número mayor es: "
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

#lógica para encontrar el número mayor 

move $t3, $t0     # mover t0 al registro t3 como si fuera el mayor 
ble $t1, $t3, numeroMayor # evaluamos si t1 es menor a t3 
move $t3, $t1   # de ser mayor t1 actualizamos el numero mayor a este 
numeroMayor:
ble $t2, $t3, imprimir # evaluamos el numero mayor con t2 si es llamamos a imprimr
move $t3, $t2 # de lo contrario t2 sera el nuevo numero mayor 

#imprimimos el mensaje de resultado y el número
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


	

.global _main  		# Primero definimos el global, aca definimos un label que indique en donde parte nuestro codigo

.data 			# Se define la seccion de data en caso de tener variables en memoria
var1: .word 1		# Se nombra la variable, se indica el tipo de dato (usaremos casi siempre word, que es un numero de 4 bytes) y se entrega el valor

.text 			# La seccion de text es en donde va a estar nuestro codigo
_main: 			# Escribimos el label definido en global

addi t0, zero, 7	# Equivalente a un MOV A, Lit. Se guarda en el registro t0 el valor de la suma entre el registro 0 y 7.
addi t1, zero, 10	# Equivalente a un MOV A, Lit. Se guarda en el registro t1 el valor de la suma entre el registro 0 y 10.
add t2, t0, t1		# Guarda en t2 el resultado de la suma del registro t0 y t1.


####################################################
#### Como ejecutar el codigo
# Para ejecutarlo, primero hay que ensamblarlo, esto se hace apretando el boton de los iconos superiores en donde aparecen las herramientas.
# Tambien se puede ensamblar el codigo en Run > Assemble o presionando F3.
#
# Una vez emsamblado se puede correr todo el codigo "de una". Esto se hace presionando el simbolo de play al lado del que se uso para ensamblar.
# Tambien se puede ejecutar en Run > Go o presionando F5.
#
# Se puede correr el codigo linea a linea, esto es recomendabla al comienzo o para debugger. Esto se hace presionando el simbolo de play con un uno al lado del de play.
# Tambien se puede ejecutar por linea en Run > Step o presionando F7.
####################################################


####################################################
#### Ahora que ya se ejecuto, donde veo los resultados?
# Se puede ver los valores de los registros al finalizar (o durante la ejecucion) del codigo. Estos se encuentran en la ventana a la
# derecha.
# En la ventana salen todos los registros por su nombre y el valor que contienen en hexadecimal, si se quiere ver en decimal tienen que ir
# a Settings y deseleccionar "Values displayed in hexadecimal".
#
# Si se quieren ver los valores almacenados en la memoria, tienen que ir a Execute y revisar el data segment.
####################################################

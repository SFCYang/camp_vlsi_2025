.data
mensaje: .string "Hello, World!\n"

.text
.global _main

_main:
    la a0, mensaje       # Cargar la dirección de la cadena en a0
    li a7, 4             # Código de ecall para imprimir string
    ecall                # Llamada al sistema para imprimir

    li a7, 10            # Código de ecall para salir del programa
    ecall

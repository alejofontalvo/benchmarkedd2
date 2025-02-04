import time

def suma_fibonacci(n):
    """
    Retorna la suma de los primeros n números de la serie de Fibonacci.
    """
    a, b = 0, 1
    total = 0

    for _ in range(n):
        total += a
        a, b = b, a + b
    
    return total

inicio = time.time()  # time.time() devuelve el tiempo actual en segundos

# Calculamos la suma de los primeros 10,000 números de Fibonacci
resultado = suma_fibonacci(10000)

# Medimos el tiempo al finalizar la ejecución de la función
fin = time.time()

# Calculamos el tiempo transcurrido en milisegundos
tiempo_ms = (fin - inicio) * 1000

# Mostramos por consola el resultado y el tiempo de ejecución
print("La suma de los primeros 10,000 términos de Fibonacci es:", resultado)
print(f"Tiempo de ejecución: {tiempo_ms:.2f} ms")

# Guardamos el resultado y el tiempo en un archivo .txt

import os

# Asegurar que la carpeta exista
output_dir = "/app/BS/soluciones/python"
os.makedirs(output_dir, exist_ok=True)  # Crea la carpeta si no existe

# Guardar el archivo en la ruta correcta
output_path = os.path.join(output_dir, "output.txt")
with open(output_path, "w") as archivo:
    archivo.write(f"La suma de los primeros 10,000 términos de Fibonacci es: {resultado}\n")
    archivo.write(f"Tiempo de ejecución: {tiempo_ms:.2f} ms\n")

    

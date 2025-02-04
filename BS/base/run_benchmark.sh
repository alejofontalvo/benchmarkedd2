#!/bin/sh

echo "Ejecutando benchmark..."

for lang in /benchmark/soluciones/*; do
    if [ -d "$lang" ]; then
        echo "Construyendo y ejecutando solución en $(basename "$lang")..."
        
        # Construir la imagen del lenguaje
        docker build -t benchmark-$(basename "$lang") "$lang"

        # Ejecutar el contenedor y guardar la salida en output.txt
        docker run --rm benchmark-$(basename "$lang") > "$lang/output.txt"

        # Mostrar la salida en consola
        cat "$lang/output.txt"
    fi
done

echo "Benchmark completado."
#sleep infinity  # Para que el contenedor base no se cierre







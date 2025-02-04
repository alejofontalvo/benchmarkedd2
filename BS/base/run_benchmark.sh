#!/bin/sh

echo "Ejecutando benchmark..."

# Recorrer todas las soluciones y ejecutar sus contenedores
for lang in /benchmark/soluciones/*; do
    if [ -d "$lang" ]; then
        echo "Ejecutando solución en $(basename "$lang")..."
        docker build -t benchmark-$(basename "$lang") "$lang"
        docker run --rm benchmark-$(basename "$lang") > "$lang/output.txt"
        cat "$lang/output.txt"
    fi
done

echo "Benchmark completado."






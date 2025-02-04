#!/bin/sh

for lang in soluciones/*; do
    if [ -d "$lang" ]; then
        echo "Ejecutando $lang..."
        docker build -t benchmark-$(basename "$lang") "$lang"
        docker run --rm benchmark-$(basename "$lang") > "$lang/output.txt"
        cat "$lang/output.txt"
    fi
done





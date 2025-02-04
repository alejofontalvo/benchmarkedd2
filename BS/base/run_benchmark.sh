#!/bin/bash
set -e


echo "=== Iniciando Benchmark ==="
echo "=== Construyendo y ejecutando python ==="
cd soluciones/python
docker build -t py .
TIME_MS=$(docker run --rm py)

# Extraer el output.txt
    CID=$(docker create py)
    docker cp "$CID:/app/output.txt" ./output.txt
    docker rm "$CID"

    RESULT=$(cat output.txt)
    echo "  - Tiempo (ms): $TIME_MS"
    echo "  - Resultado  : $RESULT"
    echo
    cd /app
  else
    echo "Carpeta soluciones/python no existe. Se omite."
  fi
done
echo "=== Benchmark completado ==="





#!/bin/bash
set -e

SOLUTIONS_DIR="/app/soluciones"
LANGUAGES=("python" "csharp" "go" "java" "javascript")

echo "=== Iniciando Benchmark ==="
for lang in "${LANGUAGES[@]}"; do
  FOLDER="$SOLUTIONS_DIR/$lang"
  if [ -d "$FOLDER" ]; then
    echo "=== Construyendo y ejecutando $lang ==="
    cd "$FOLDER"
    docker build -t "benchmark-$lang" .
    TIME_MS=$(docker run --rm "benchmark-$lang")

    # Extraer el output.txt
    CID=$(docker create "benchmark-$lang")
    docker cp "$CID:/app/output.txt" ./output.txt
    docker rm "$CID"

    RESULT=$(cat output.txt)
    echo "  - Tiempo (ms): $TIME_MS"
    echo "  - Resultado  : $RESULT"
    echo
    cd /app
  else
    echo "Carpeta $FOLDER no existe. Se omite."
  fi
done
echo "=== Benchmark completado ==="





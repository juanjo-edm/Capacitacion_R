#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p docs

if ! Rscript -e 'quit(status = !rmarkdown::pandoc_available())' >/dev/null 2>&1; then
  PANDOC_BIN="$(find /Applications/RStudio.app /Applications/Positron.app -type f -name pandoc 2>/dev/null | head -n 1 || true)"
  if [[ -n "$PANDOC_BIN" ]]; then
    export RSTUDIO_PANDOC="$(dirname "$PANDOC_BIN")"
  fi
fi

Rscript -e 'rmarkdown::render("notebooks/Cuaderno_Capacitacion_R.Rmd", output_dir = "docs", output_file = "cuaderno_capacitacion_r.nb.html", quiet = TRUE)'

rm -f notebooks/report.html

echo "Render completo:"
echo "- docs/cuaderno_capacitacion_r.nb.html"

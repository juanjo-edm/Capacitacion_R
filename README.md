# Capacitacion R

Proyecto de capacitacion introductoria en R centrado en el cuaderno principal `notebooks/Cuaderno_Capacitacion_R.Rmd`.

## Objetivo

Este repositorio documenta un recorrido practico por R, RStudio, importacion de datos, limpieza, transformacion con `dplyr`, visualizacion con `ggplot2` y reporte reproducible. El cuaderno se mantiene actualizado para `dplyr >= 1.2.1` e incluye funciones modernas como `.by`, `join_by()`, `filter_out()`, `when_any()`, `when_all()`, `reframe()`, `recode_values()` y `replace_values()`.

## Estructura

```text
.
├── docs/
│   └── cuaderno_capacitacion_r.nb.html
├── notebooks/
│   ├── Cuaderno_Capacitacion_R.Rmd
│   ├── credit.csv
│   ├── credit.tsv
│   ├── credit.xlsx
│   ├── credit_semicolon.txt
│   └── images/
├── scripts/
│   ├── install_r_packages.R
│   └── render_all.sh
├── Capacitacion-R.Rproj
└── README.md
```

## Reproduccion

1. Abrir el proyecto `Capacitacion-R.Rproj`.

2. Instalar dependencias de R:

```bash
Rscript scripts/install_r_packages.R
```

3. Renderizar el cuaderno:

```bash
bash scripts/render_all.sh
```

## Salida principal

- `docs/cuaderno_capacitacion_r.nb.html`

## Publicacion con el boton Publish

Este proyecto esta preparado para publicarse desde RStudio con el boton **Publish**, sin usar comandos de despliegue.

1. Abrir `Capacitacion-R.Rproj` en RStudio.
2. Ejecutar una sola vez `Rscript scripts/install_r_packages.R` desde la Terminal de RStudio para reparar o instalar dependencias locales.
3. Abrir `notebooks/Cuaderno_Capacitacion_R.Rmd`.
4. Renderizar con **Knit** para verificar que el HTML se genera correctamente.
5. Hacer clic en **Publish** y escoger Posit Cloud / Posit Connect Cloud como destino.

Si Posit Cloud no aparece en el dialogo, revisar en RStudio: **Tools > Global Options > Publishing** y activar la opcion de publicacion a Posit Cloud. Si el boton vuelve a pedir una libreria, ejecutar de nuevo el instalador del proyecto y reiniciar la sesion de R.

## Enfoque pedagogico

El cuaderno conserva una estructura de capacitacion: explicaciones conceptuales, ejemplos ejecutables, comentarios dentro del codigo, interpretacion de resultados, graficos y cierre con informacion de sesion para reproducibilidad.

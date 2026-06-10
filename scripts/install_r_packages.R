required_packages <- c(
  "tidyverse", "dplyr", "tidyr", "ggplot2", "readr", "stringr",
  "lubridate", "purrr", "data.table", "janitor", "messy", "naniar",
  "visdat", "readxl", "writexl", "jsonlite", "DBI", "RSQLite",
  "skimr", "summarytools", "DataExplorer", "Hmisc",
  "formattable", "ISLR", "gapminder", "DT", "reactable", "plotly",
  "scales", "here", "rmarkdown", "knitr", "rsconnect", "cluster",
  "selectr"
)

minimum_versions <- c(
  dplyr = "1.2.1",
  rsconnect = "1.8.0",
  summarytools = "1.1.5"
)

repos <- getOption("repos")
if (is.null(repos) || identical(unname(repos["CRAN"]), "@CRAN@")) {
  repos <- c(CRAN = "https://cloud.r-project.org")
}

is_missing_or_old <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    return(TRUE)
  }

  minimum_version <- unname(minimum_versions[package])
  if (!is.na(minimum_version)) {
    return(utils::packageVersion(package) < minimum_version)
  }

  FALSE
}

packages_to_install <- required_packages[vapply(required_packages, is_missing_or_old, logical(1))]

if (length(packages_to_install) > 0) {
  install.packages(packages_to_install, repos = repos)
} else {
  message("Todos los paquetes requeridos ya estan instalados.")
}

if (!requireNamespace("dplyr", quietly = TRUE) || utils::packageVersion("dplyr") < "1.2.1") {
  message("Instalando dplyr 1.2.1 desde fuente para usar la version oficial mas reciente.")

  macos_cpp_headers <- Sys.glob(
    "/Library/Developer/CommandLineTools/SDKs/MacOSX*.sdk/usr/include/c++/v1"
  )
  if (length(macos_cpp_headers) > 0 && Sys.getenv("CPLUS_INCLUDE_PATH") == "") {
    Sys.setenv(CPLUS_INCLUDE_PATH = utils::tail(sort(macos_cpp_headers), 1))
  }

  install.packages("dplyr", repos = repos, type = "source")
}

if (!requireNamespace("rsconnect", quietly = TRUE) || utils::packageVersion("rsconnect") < "1.8.0") {
  message("Instalando rsconnect 1.8.0 desde fuente para habilitar el boton Publish.")
  unlink(file.path(.libPaths()[1], "00LOCK-rsconnect"), recursive = TRUE, force = TRUE)
  install.packages("rsconnect", repos = repos, type = "source")
}

message("Version dplyr instalada: ", as.character(utils::packageVersion("dplyr")))
message("Version rsconnect instalada: ", as.character(utils::packageVersion("rsconnect")))

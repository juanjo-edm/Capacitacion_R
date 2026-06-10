library(rsconnect)

rsconnect::writeManifest(
  appDir = ".",
  appPrimaryDoc = "Cuaderno_Capacitacion_R.Rmd",
  appMode = "rmd-static"
)

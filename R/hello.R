#' Launch ECDM Shiny Modeling Application
#'
#' Open up an interactive shiny modeling application
#' @export
shiny_edina <- function() {
  appDir <- system.file("shiny", "edina", package = "shinyecdm")
  if (appDir == "") {
    stop("Could not find `shiny` directory. Try re-installing `shinyecdm`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

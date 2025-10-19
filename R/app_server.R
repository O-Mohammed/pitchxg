#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  selected <-
  mod_select_match_server("select_match_1")
  mod_shotmap_server("shotmap_1", selected)
}

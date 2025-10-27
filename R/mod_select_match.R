#' select_match UI Function
#'
#' @description A shiny Module for selecting a match from a dropdown list
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
match_data <- readRDS("inst/app/data/matches_womens_euro_2025.rds")
team_names <- readRDS("inst/app/data/teams_womens_euro_2025.rds")

mod_select_match_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shinyjs::useShinyjs(),
    shiny::selectInput(ns("select_match"), 
                       label = "Select match",
                       choices = unique(match_data$match_id),
                       selected = "4020846"),
    shinyjs::disabled(shiny::selectInput(ns("select_team"), 
                       label = "Select team",
                       choices = team_names)
    )
 
  )
}
    
#' select_match Server Functions
#'
#' @noRd 
mod_select_match_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    selected_match <- shiny::reactive(input$select_match)
    selected_team <- shiny::reactive(input$select_team)

    list(
      match = selected_match,
      team = selected_team
    )
  })
}
    
## To be copied in the UI
# mod_select_match_ui("select_match_1")
    
## To be copied in the server
# mod_select_match_server("select_match_1")

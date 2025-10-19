#' shotmap UI Function
#'
#' @description A shiny Module. Creates a shotmap
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_shotmap_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::plotOutput(ns("shotmap"))
  )
}
    
#' shotmap Server Functions
#'
#' @noRd 
mod_shotmap_server <- function(id, selected){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    shot_data <- readRDS("inst/app/data/shots_womens_euro_2025.rds")

    output$shotmap <- shiny::renderPlot({
      shiny::req(selected$match())

      plot_data <- shot_data[[as.character(selected$match())]][["shot_data"]]

      SBpitch::create_Pitch(grass_colour = "grey30",
                            background_colour = "grey30",
                            line_colour = "grey80")+
        ggplot2::geom_point(data = plot_data,
                            ggplot2::aes(x, y,
                                         fill = goal,
                                         size = xG),
                            pch = 21)+
        ggplot2::scale_size_continuous(limits = c(0,1), breaks = c(0, 0.25, 0.5, 0.75, 1))+
        ggplot2::scale_fill_manual(breaks = c("Goal", "No goal"), values = c("gold", "grey20"))+
        ggplot2::coord_flip(xlim = c(60, 120), ylim = c(0,80))+
        ggplot2::theme(legend.position = c(.5, .2),
                       legend.direction = "horizontal",
                       legend.box.just = "centre",
                       legend.background = element_rect(colour = "grey20",
                                                        fill = alpha("grey40", 0.5)),
                       legend.key = element_rect(fill = NA, colour = NA))+
        ggplot2::guides(fill = ggplot2::guide_legend(override.aes = list(size = 6)))
    })
    
    
  })
}
    
## To be copied in the UI
# mod_shotmap_ui("shotmap_1")
    
## To be copied in the server
# mod_shotmap_server("shotmap_1")

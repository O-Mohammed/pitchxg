#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shiny::fluidPage(
      theme = bslib::bs_theme(),
      bslib::page_navbar(
        title = "pitchxg",
        bslib::nav_panel(
          title = "Shotmap",
          bslib::card(
            full_screen = TRUE,
            bslib::layout_sidebar(
              sidebar = mod_select_match_ui("select_match_1"),
              mod_shotmap_ui("shotmap_1")
            )
            
          )
        ),
        bslib::nav_spacer(),
        bslib::nav_item(
          bslib::input_dark_mode()
        ),
        bslib::nav_item(
          shiny::a(
            href = "https://github.com/O-Mohammed/pitchxg",
            target = "_blank",
            shiny::icon("github", class = "fa-xl")
          )
        )
      )
    )
  )
  
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "pitch-xg"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

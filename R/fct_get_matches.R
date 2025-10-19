#' Get all matches for selected season 
#'
#' @description `get_matches()` returns a tibble of matches for selected season.
#'
#' @param season_id Character. The season_id to return events for.
#' 
#' @return A tibble, containing all matches for selected season.
#'
#' @export
get_matches <- function(season_id) {
  comp <- StatsBombR::FreeCompetitions() |> 
    dplyr::filter(.data$season_id == .env$season_id)
  
  matches <- StatsBombR::FreeMatches(comp)
}

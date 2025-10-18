#' Fetch events for a specified season_id using StatsBombR 
#'
#' @description `get_events()` downloads events data using StatsBombr package.
#'
#' @param season_id Character. The season_id to return events for.
#' 
#' @return List. A list of tibbles. One tibble per match, containing all event 
#'   data for that match.
#'
#' @export 
get_events <- function(season_id){
  
  comp <- StatsBombR::FreeCompetitions() |> 
    dplyr::filter(.data$season_id == .env$season_id)
  
  matches <- StatsBombR::FreeMatches(comp)
  
  events <- matches |> 
    dplyr::group_nest(dplyr::row_number()) |> 
    dplyr::pull(data) |> 
    purrr::map(StatsBombR::get.matchFree)
  
}
#' Fetch events for a specified season_id using StatsBombR 
#'
#' @description `get_events()` downloads events data using StatsBombr package.
#'
#' @param matches A tibble. The output of `get_matches`.
#' 
#' @return List. A list of metadata and tibbles. One tibble per match, containing all event 
#'   data for that match.
#'
#' @export 
get_events <- function(matches){
  
  events <- matches |> 
    dplyr::group_nest(dplyr::row_number()) |> 
    dplyr::pull(data) |> 
    purrr::map(\(x) list(match_id = x$match_id, 
                         match_date = x$match_date, 
                         match_week = x$match_week,
                         season = x$season.season_name,
                         home_team = x$home_team.country.name,
                         away_team = x$away_team.country.name,
                         competition_stage = x$competition_stage.name,
                         event_data = StatsBombR::get.matchFree(x))
               )
  
}

#' Extract and process shot events from StatsBomb data 
#'
#' @description `get_shots()` takes the output from `get_events()` and processes,
#' shot events for analysis or visualisation.
#'
#' @param events A list of tibbles or a single tibble of Statsbomb events, the
#' output of `get_events()`.
#'
#' @return A list of tibbles. One tibble per match, containing shot data for 
#' that match.
#'
#' @export
get_shots <- function(event) {
  
  metadata <- event[!names(event) %in% "event_data"]
  
  shot_data <- event[["event_data"]] |> 
    dplyr::select(c("timestamp", 
                    "location", 
                    "possession",
                    "possession_team.name",
                    tidyselect::starts_with("shot"))) |> 
    dplyr::filter(!is.na(shot.type.id)) |> 
    tidyr::unnest_wider(location, names_sep = "_") |> 
    dplyr::rename("x" = location_1,
                  "y" = location_2,
                  "xG" = shot.statsbomb_xg) |> 
    dplyr::mutate(goal = dplyr::if_else(shot.outcome.id == 97, "Goal", "No goal"))
  
  c(metadata,
    list(shot_data = shot_data))
}
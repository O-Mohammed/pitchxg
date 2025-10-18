
comp <- StatsBombR::FreeCompetitions() |> 
  dplyr::filter(season_id == 315) #Womens EURO 2025

weuro25_matches <- StatsBombR::FreeMatches(comp)

weuro25_events <- weuro25_matches |> 
  dplyr::group_nest(dplyr::row_number()) |> 
  dplyr::pull(data) |> 
  purrr::map(StatsBombR::get.matchFree)
  
weuro25_shots <- weuro25_events |> 
  purrr::map(\(x) dplyr::select(x, c("timestamp", "location", tidyselect::starts_with("shot")))) |> 
  purrr::map(\(x) dplyr::filter(x, !is.na(shot.type.id)))

saveRDS(weuro25_shots, "inst/extdata/shots_womens_euro_2025.rds") 

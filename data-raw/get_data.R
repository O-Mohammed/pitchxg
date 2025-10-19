
season_id <- 315 #Womens EURO 2025

matches <- get_matches(season_id)

events <- get_events(matches)

shots <- events |> 
  purrr::imap(\(x, id) get_shots(x))

teams <- matches |> 
  dplyr::select(away_team.away_team_name, 
                home_team.home_team_name) |> 
  unlist() |> 
  unique()

saveRDS(shots, "inst/app/data/shots_womens_euro_2025.rds") 
saveRDS(matches, "inst/app/data/matches_womens_euro_2025.rds")
saveRDS(teams, "inst/app/data/teams_womens_euro_2025.rds")
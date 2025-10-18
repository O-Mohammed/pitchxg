
season_id <- 315 #Womens EURO 2025

events <- get_events(season_id)

shots <- purrr::map(events, get_shots)

saveRDS(shots, "inst/app/data/shots_womens_euro_2025.rds") 

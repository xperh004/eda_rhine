library(data.table)

runoff_stations <- readRDS('./data/runoff_stations_raw.rds')

stations_small <- runoff_stations[, .(sname, area, altitude)]

stations_tidy <- melt(stations_small, id.vars = 'sname')
stations_tidy
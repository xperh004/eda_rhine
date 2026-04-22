library(data.table)
library(ggplot2)

runoff_stations <- readRDS('./data/runoff_stations_raw.rds')

stations_small <- runoff_stations[, .(sname, area, altitude)]

ggplot(stations_small, aes(x = area, y = altitude)) +
  geom_point() +
  theme_bw()
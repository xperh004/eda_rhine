library(data.table)
library(ggplot2)

runoff_stations <- readRDS('./data/runoff_stations.rds')

runoff_stations[, area_class := factor('small')]
runoff_stations[area >= 20000 & area < 100000, area_class := factor('medium')]
runoff_stations[area >= 100000, area_class := factor('large')]

runoff_stations[, alt_class := factor('low')]
runoff_stations[altitude >= 100 & altitude < 500, alt_class := factor('medium')]
runoff_stations[altitude >= 500, alt_class := factor('high')]

ggplot(runoff_stations, aes(x = area, y = altitude, col = area_class, shape = alt_class)) +
  geom_point(size = 3) +
  theme_bw() +
  xlab('Area (km2)') +
  ylab('Altitude (m)')
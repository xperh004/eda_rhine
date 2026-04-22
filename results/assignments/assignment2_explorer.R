library(data.table)
library(ggplot2)

runoff_stations <- readRDS('./data/runoff_stations.rds')
runoff_day <- readRDS('./data/runoff_day.rds')

mean_area <- round(mean(runoff_stations$area), 0)
mean_runoff <- round(mean(runoff_day$value), 0)

mean_area
mean_runoff

mean_runoff_station <- runoff_day[, .(mean_runoff = round(mean(value), 0)), by = sname]

ggplot(mean_runoff_station, aes(x = reorder(sname, mean_runoff), y = mean_runoff)) +
  geom_bar(stat = 'identity', fill = "#97B8C2") +
  theme_bw() +
  xlab('Station') +
  ylab('Mean runoff (m3/s)') +
  coord_flip()
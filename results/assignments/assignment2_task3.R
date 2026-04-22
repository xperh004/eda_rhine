library(data.table)
library(ggplot2)

runoff_stations <- readRDS('./data/runoff_stations_raw.rds')
runoff_day <- readRDS('./data/runoff_day_raw.rds')
runoff_day <- runoff_day[value >= 0]

ggplot(runoff_day, aes(x = date, y = value)) +
  geom_line() +
  facet_wrap(~sname) +
  theme_bw()

ggplot(runoff_day, aes(x = date, y = value)) +
  geom_line() +
  facet_wrap(~sname, scales = 'free') +
  theme_bw()
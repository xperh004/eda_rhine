library(data.table)
library(ggplot2)

runoff_day <- readRDS('./data/runoff_day_raw.rds')
runoff_day <- runoff_day[value >= 0]

station_time <- runoff_day[, .(start = min(year(date)),
                               end = max(year(date))),
                           by = sname]

ggplot(station_time, aes(x = start, xend = end, y = sname, yend = sname)) +
  geom_segment(linewidth = 2) +
  theme_bw() +
  xlab('Year') +
  ylab('Station')
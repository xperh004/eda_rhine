library(data.table)
library(ggplot2)

runoff_day <- readRDS('./data/runoff_day.rds')

runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               median_day = round(median(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]

runoff_stats_tidy <- melt(runoff_stats, id.vars = 'sname')

ggplot(runoff_stats_tidy, aes(x = sname, y = value,
                              col = variable, shape = variable)) +
  geom_point(size = 3) +
  theme_bw() +
  xlab('Station') +
  ylab('Runoff (m3/s)') +
  theme(axis.text.x = element_text(angle = 90))
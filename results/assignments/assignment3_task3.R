library(data.table)
library(ggplot2)

runoff_day <- readRDS('./data/runoff_day.rds')
runoff_day[, month := month(date)]

runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0)), by = sname]

runoff_stats[, runoff_class := factor('low')]
runoff_stats[mean_day >= 1000 & mean_day < 2000, runoff_class := factor('medium')]
runoff_stats[mean_day >= 2000, runoff_class := factor('high')]

runoff_month <- runoff_day[, .(value = mean(value)), by = .(month, year(date), sname)]

to_plot <- runoff_month[runoff_stats[, .(sname, runoff_class)], on = 'sname']

ggplot(to_plot, aes(x = factor(month), y = value, fill = runoff_class)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free') +
  theme_bw() +
  xlab('Month') +
  ylab('Runoff (m3/s)')
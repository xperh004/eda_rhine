library(data.table)
library(ggplot2)

runoff_day <- readRDS('./data/runoff_day.rds')

ggplot(runoff_day, aes(x = sname, y = value)) +
  geom_boxplot() +
  theme_bw() +
  xlab('Station') +
  ylab('Runoff (m3/s)') +
  theme(axis.text.x = element_text(angle = 90))
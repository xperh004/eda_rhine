library(data.table)
library(ggplot2)

runoff_summer_key <- readRDS('./data/runoff_summer_key.rds')
runoff_winter_key <- readRDS('./data/runoff_winter_key.rds')

ggplot(runoff_summer_key[year >= 1950 & year <= 2010], aes(x = year, y = value)) +
  geom_line(col = "#D6C6B9") +
  geom_point(col = "#D6C6B9") +
  facet_wrap(~sname, scales = 'free') +
  geom_smooth(method = 'lm', formula = y~x, se = 0, col = "#D35C37") +
  geom_smooth(method = 'loess', formula = y~x, se = 0, col = "#97B8C2") +
  xlab('Year') +
  ylab('Runoff (m3/s)') +
  ggtitle('Summer runoff 1950-2010') +
  theme_bw()

ggplot(runoff_winter_key[year >= 1950 & year <= 2010], aes(x = year, y = value)) +
  geom_line(col = "#D6C6B9") +
  geom_point(col = "#D6C6B9") +
  facet_wrap(~sname, scales = 'free') +
  geom_smooth(method = 'lm', formula = y~x, se = 0, col = "#D35C37") +
  geom_smooth(method = 'loess', formula = y~x, se = 0, col = "#97B8C2") +
  xlab('Year') +
  ylab('Runoff (m3/s)') +
  ggtitle('Winter runoff 1950-2010') +
  theme_bw()
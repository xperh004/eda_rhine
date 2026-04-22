library(data.table)
library(ggplot2)

runoff_winter_key <- readRDS('./data/runoff_winter_key.rds')
runoff_summer_key <- readRDS('./data/runoff_summer_key.rds')
runoff_month_key <- readRDS('./data/runoff_month_key.rds')
runoff_year_key <- readRDS('./data/runoff_year_key.rds')

year_thres <- 2000

runoff_winter_key[year < year_thres, period := factor('pre_2000')]
runoff_winter_key[year >= year_thres, period := factor('aft_2000')]
runoff_summer_key[year < year_thres, period := factor('pre_2000')]
runoff_summer_key[year >= year_thres, period := factor('aft_2000')]
runoff_month_key[year < year_thres, period := factor('pre_2000')]
runoff_month_key[year >= year_thres, period := factor('aft_2000')]

to_plot_annual <- runoff_year_key
to_plot_annual[year < year_thres, period := factor('pre_2000')]
to_plot_annual[year >= year_thres, period := factor('aft_2000')]

ggplot(to_plot_annual, aes(x = factor(year %/% 10 * 10), y = value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = c("#97B8C2", "#D35C37")) +
  xlab('Decade') +
  ylab('Runoff (m3/s)') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))

ggplot(runoff_month_key, aes(x = factor(month), y = value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = c("#97B8C2", "#D35C37")) +
  xlab('Month') +
  ylab('Runoff (m3/s)') +
  theme_bw()
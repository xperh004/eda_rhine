library(data.table)
library(ggplot2)

precip_day <- readRDS('./data/raw/precip_day.rds')

precip_day[, year := year(date)]
precip_day[, month := month(date)]
precip_day[month == 12 | month == 1 | month == 2, season := 'winter']
precip_day[month == 6 | month == 7 | month == 8, season := 'summer']

precip_winter <- precip_day[season == 'winter', .(value = mean(value)), by = year]
precip_summer <- precip_day[season == 'summer', .(value = mean(value)), by = year]

year_thres <- 2000
precip_winter[year < year_thres, period := factor('pre_2000')]
precip_winter[year >= year_thres, period := factor('aft_2000')]
precip_summer[year < year_thres, period := factor('pre_2000')]
precip_summer[year >= year_thres, period := factor('aft_2000')]

to_plot <- rbind(cbind(precip_winter, season = factor('winter')),
                 cbind(precip_summer, season = factor('summer')))

ggplot(to_plot, aes(x = season, y = value, fill = period)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#97B8C2", "#D35C37")) +
  xlab('Season') +
  ylab('Precipitation (mm/day)') +
  theme_bw()

precip_year <- precip_day[, .(value = mean(value)), by = year]

ggplot(precip_year[year > 1950], aes(x = year, y = value)) +
  geom_line(col = "#D6C6B9") +
  geom_point(col = "#D6C6B9") +
  geom_smooth(method = 'lm', formula = y~x, se = 0, col = "#D35C37") +
  geom_smooth(method = 'loess', formula = y~x, se = 0, col = "#97B8C2") +
  xlab('Year') +
  ylab('Precipitation (mm/day)') +
  theme_bw()
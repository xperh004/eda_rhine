library(data.table)

runoff_day <- readRDS('./data/runoff_day_raw.rds')

runoff_month_mean <- runoff_day[month(date) %in% c(1, 2, 3),
                                .(mean_runoff = mean(value)),
                                by = month(date)]

runoff_month_mean[, pct_change := (mean_runoff - shift(mean_runoff)) / 
                    shift(mean_runoff) * 100]

runoff_month_mean
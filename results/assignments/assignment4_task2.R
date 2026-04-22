library(data.table)

runoff_day <- readRDS('./data/runoff_day.rds')

runoff_thresholds <- runoff_day[, .(q90 = quantile(value, 0.9),
                                    q10 = quantile(value, 0.1)), by = sname]

runoff_high <- runoff_day[runoff_thresholds, on = 'sname'][value > q90,
                                                           .(mean_high = round(mean(value), 0), n_days_high = .N), by = sname]

runoff_low <- runoff_day[runoff_thresholds, on = 'sname'][value < q10,
                                                          .(mean_low = round(mean(value), 0), n_days_low = .N), by = sname]

runoff_extremes <- runoff_high[runoff_low, on = 'sname']
runoff_extremes
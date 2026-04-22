library(data.table)
library(moments)

runoff_day <- readRDS('./data/runoff_day.rds')

runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               median_day = round(median(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]

runoff_stats[, skewness := round(skewness(runoff_day[sname == .BY$sname, value]), 3), by = sname]
runoff_stats[, cv := round(sd(runoff_day[sname == .BY$sname, value]) /
                             mean(runoff_day[sname == .BY$sname, value]), 3), by = sname]

runoff_skew_cv <- runoff_stats[, .(sname, skewness, cv)]
runoff_skew_cv
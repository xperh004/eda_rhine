library(data.table)
library(ggplot2)

runoff_month <- readRDS('./data/runoff_month.rds')
runoff_year <- readRDS('./data/runoff_year.rds')

highest_month <- runoff_month[, .SD[which.max(value)], by = sname][, .(sname, month, year, value)]
lowest_month <- runoff_month[, .SD[which.min(value)], by = sname][, .(sname, month, year, value)]

highest_year <- runoff_year[, .SD[which.max(value)], by = sname][, .(sname, year, value)]
lowest_year <- runoff_year[, .SD[which.min(value)], by = sname][, .(sname, year, value)]

highest_month
lowest_month
highest_year
lowest_year
# Explorer Question 2
# Rainfall runoff calculation for Rhine catchment

catchment_area_km2 <- 185000
rainfall_mm_per_hour <- 0.5
hours <- 24

total_rainfall_m3 <- (rainfall_mm_per_hour / 1000) * (catchment_area_km2 * 1e6) * hours

runoff_increase_m3s <- total_rainfall_m3 / (hours * 3600)

runoff_increase_m3s
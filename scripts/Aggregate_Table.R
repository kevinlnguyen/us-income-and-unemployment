# Alfred Escorpiso

library(dplyr)

aggregate_table <- function(dataset) {
  year_1900_min_wage <- dataset %>%
    filter(Year < 2000) %>%
    group_by(State) %>%
    summarize(
      Avg_High_1900s = mean(High.Value),
      Avg_Low_1900s = mean(Low.Value)
    )
  year_2000_min_wage <- dataset %>%
    filter(Year >= 2000) %>%
    group_by(State) %>%
    summarize(
      Avg_High_2000s = mean(High.Value),
      Avg_Low_2000s = mean(Low.Value)
    )
  min_wage_combined <- left_join(year_1900_min_wage, year_2000_min_wage,
    by = "State"
  )

  return(min_wage_combined)
}

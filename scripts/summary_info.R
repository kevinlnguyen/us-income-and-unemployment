# Harsimarjeet Tumber

library("dplyr")

summary_info <- function(dataset) {
  ret <- list()

  # getting the state with the overall highest pay
  highest_average_pay <- dataset %>%
    group_by(State) %>%
    summarize(total = mean(High.2018, na.rm = TRUE)) %>%
    filter(total == max(total))


  # getting the state with the overall lowest pay
  # removing states with 0 as they don't have data on them
  lowest_average_pay <- dataset %>%
    group_by(State) %>%
    summarize(total = mean(High.2018, na.rm = TRUE)) %>%
    filter(total != 0) %>%
    filter(total == min(total))

  # getting the average CPI for all the states
  average_CPI <- dataset %>%
    summarize(total = mean(CPI.Average, na.rm = TRUE)) %>%
    pull(total)

  # getting the overall average
  overall_average <- dataset %>%
    summarize(total = mean(High.2018, na.rm = TRUE)) %>%
    pull(total)

  # getting the worst year which had the most bad pay
  worst_year <- dataset %>%
    group_by(Year) %>%
    summarize(total = mean(High.2018, na.rm = TRUE)) %>%
    filter(total != 0) %>%
    filter(total == min(total))

  ret$highest_average_pay <- highest_average_pay
  ret$lowest_average_pay <- lowest_average_pay
  ret$overall_average <- overall_average
  ret$average_CPI <- average_CPI
  ret$worst_year <- worst_year

  return(ret)
}

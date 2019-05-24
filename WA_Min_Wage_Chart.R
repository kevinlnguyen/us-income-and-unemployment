US_min_wage_df <- read.csv("data/Minimum_Wage_Data.csv", stringsAsFactors
                           = FALSE)


library(dplyr)
library(tidyr)
library(ggplot2)
library(rbokeh)
library(plotly)
library(lintr)

# Comparing two states' minimum wage over the last 17 years, any 
# noticeable changes?
WA_NY_comparison <- function(dataset){

  compare_WA_NY <- dataset %>%
    mutate(Minimum_Wage_2018 = paste0("$", High.2018)) %>%
    mutate(Minimum_Wage = High.Value) %>%
    filter(State == "Washington" | State == "New York") %>%
    filter(Year >= "2000") %>%
    select(State, Year, Minimum_Wage, High.2018, CPI.Average)

  example_graph <- plot_ly(
    data = compare_WA_NY,
    x = ~Year,
    y = ~High.2018,
    type = "scatter",
    mode = "lines + markers",
    color = ~State
  ) %>%
    layout(    xaxis = list(title = "Year"),
               yaxis = list(title = "Minimum Wage ($)")
    )
  return(example_graph)
}

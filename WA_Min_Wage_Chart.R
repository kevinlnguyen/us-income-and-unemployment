US_min_wage_df <- read.csv("data/Minimum_Wage_Data.csv", stringsAsFactors = FALSE)


library(dplyr)
library(tidyr)
library(ggplot2)
library(rbokeh)
library(plotly)


compare_WA_NY <- US_min_wage_df %>% 
  filter(State == "Washington" | State == "New York") %>% 
  filter(Year >= "2000")

example_graph <- plot_ly(
  data = compare_WA_NY,
  x = ~Year,
  y= ~High.2018,
  type = "scatter",
  mode = "lines + markers",
  color = ~State
) %>% 
  layout(
    title = "Minimum Wage Fluctuation in WA and NY State Over the Last Century",
    xaxis = list(title = "Year"),
    yaxis = list(title = "Minimum Wage ($)", ticksuffix = "$")
  ) 

  

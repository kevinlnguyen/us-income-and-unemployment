library(dplyr)
library(ggplot2)

ten_states_graph <- function(data) {
  top_10_states <- data %>%
    filter(Year == 2017) %>%
    top_n(10, wt = High.Value)
  
  # Render a horizontal bar chart of population
  states_plot <- top_10_states %>%
    ggplot() +
    geom_col(mapping = aes(x = State, y = High.Value)) +
    labs(
      title = "Ten Highest MInimum Wage States in 2017", # plot title
      x = "State", # x-axis label
      y = "Minimum Wage (in USD)" # y-axis label
    ) + coord_flip()
  
  states_plot
}
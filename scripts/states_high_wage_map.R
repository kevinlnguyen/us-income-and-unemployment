# Oscar Perez

library(dplyr)
library(plotly)

wage_map_plot <- function(data) {
  wage <- data %>%
    group_by(State) %>%
    summarize(highest_min_wage = max(High.Value), lowest_min_wage =
                min(Low.Value), wage_2018 = max(High.2018)) %>%
    mutate(hover = paste0(State, "<br>", "Highest Minimum Wage: $",
                          highest_min_wage, "<br>", "Lowest Minimum Wage: $",
                          lowest_min_wage)) %>%
    mutate(code = state.abb[match(State, state.name)])
  
  # give state boundaries a white border
  boundaries <- list(color = toRGB("white"), width = 2)
  # specify some map projection/options
  map_projections <- list(
    scope = "usa",
    projection = list(type = "albers usa"),
    showlakes = TRUE,
    lakecolor = toRGB("white")
  )
  
  states_map_plot <- plot_geo(wage, locationmode = "USA-states") %>%
    add_trace(
      z = ~highest_min_wage, text = ~hover, locations = ~code,
      color = ~highest_min_wage, colors = "Purples"
    ) %>%
    colorbar(title = "Minimum Wage (in USD)") %>%
    layout(
      title = "Highest Minimum Wages Across the United States",
      geo = map_projections
    )
  states_map_plot
}
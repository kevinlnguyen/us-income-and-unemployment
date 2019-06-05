# Returns a bar plot of all states in the given data frame against their
# unemployment rate in the given year
unemploy_bar_plot <- function(data, year) {
  # Filter data by year and average rate in state
  data <- data %>%
    group_by(State, Year) %>%
    summarize(unemployment_rate = mean(Rate)) %>%
    mutate(hover = paste0("Unemployment Rate: ", unemployment_rate)) %>%
    filter(Year == year)
  
  # Create bar plot with states on X and unemployment rate on Y
  plot <- plot_ly(
    data = data,
    x = ~State, # use a formula to specify the column for the x-axis
    y = ~unemployment_rate, # use a formula to specify the column for the y-axis
    text = ~hover,
    hoverinfo = "text",
    type = "bar"
  ) %>%
    layout(
      title = paste0("Unemployment Rates Across States in ", year),
      xaxis = list(title = "State"),
      yaxis = list(title = "Unemployment Rate (Percent)")
    )
  plot
}
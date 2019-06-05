library(dplyr)

# Returns a line plot of the given state in the given data frame
# with its unemployment rate plotted over time between the given
# years (inclusive)
rate_plot_over_time <- function(data, state, year_one, year_two) {
  # Group and filter data to plot by state and years
  data <- data %>%
    group_by(State, Year) %>%
    summarize(unemployment_rate = mean(Rate)) %>%
    mutate(hover = paste0("Year: ", Year, "<br>", "Unemployment Rate:",
                          unemployment_rate)) %>%
    filter(State == state & Year >= year_one & Year <= year_two)
  
  # Create line plot with time on X axis and unemployment rate on
  # Y axis
  rate_plot <- plot_ly(
    data = data,
    x = ~Year,
    y = ~unemployment_rate,
    text = ~hover,
    hoverinfo = "text",
    type = "scatter",
    mode = "lines + markers"
  ) %>%
    layout(
      title = paste0("Unemployment Rate Over Time in ", state),
      xaxis = list(title = "Year"),
      yaxis = list(title = "Unemployment Rate (Percent)")
    )
  rate_plot
}
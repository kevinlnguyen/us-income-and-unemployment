# function to create a plotly with the minimum wage data
# changes the plot accordin to the state and years selected
mw_func <- function(data, state, year1, year2) {
  mw_data <- data %>%
    filter(Year >= year1 & Year <= year2) %>%
    group_by(Year) %>%
    filter(Name == state) %>%
    summarize(minimum_wage = mean(Annual.State.Minimum, na.rm = TRUE)) %>%
    mutate(hover = paste0(
      "Year: ",
      Year,
      "<br>",
      "Minimum Wage: ",
      minimum_wage
    ))

  plot_ly(
    data = mw_data,
    x = ~Year,
    y = ~minimum_wage,
    text = ~hover,
    hoverinfo = "text",
    type = "scatter",
    mode = "lines+markers"
  ) %>%
    layout(
      title = paste0(
        "Minimum wage for ",
        state,
        " from ",
        year1, " to ", year2
      ),
      xaxis = list(title = "Years"),
      yaxis = list(title = "Rate")
    )
}

# creates a bar plot for the minimum wage data
# shows th minimum wage for the seceted year in all the states
mw_bar_plot <- function(data, year) {
  # Filter data by year and average rate in state
  data <- data %>%
    group_by(Name, Year) %>%
    summarize(minimum_wage = mean(Annual.State.Minimum, na.rm = TRUE)) %>%
    mutate(hover = paste0("Minimum wage: ", minimum_wage)) %>%
    filter(Year == year)

  # Create bar plot with states on X and unemployment rate on Y
  rate_bar_plot <- plot_ly(
    data = data,
    x = ~Name,
    y = ~minimum_wage,
    text = ~hover,
    hoverinfo = "text",
    type = "bar"
  ) %>%
    layout(
      title = paste0("Minimum wage Across States in ", year),
      xaxis = list(title = "State"),
      yaxis = list(title = "Minimum wage")
    )
  rate_bar_plot
}

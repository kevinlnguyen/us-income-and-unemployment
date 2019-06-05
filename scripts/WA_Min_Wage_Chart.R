# Kevin Nguyen
## Recreating plot with search function
build_scatter <- function(df, state) {
  df <- df %>%
    filter(Name == state)

  plot <- plot_ly(
    x = df$year,
    y = df$VZ_mw,
    mode = "markers",
    type = "scatter",
    marker = list(
      opacity = 0.6,
      size = 8
    )
  ) %>%
    layout(
      xaxis = list(
        range = c(0, (max(df$Year) * 1.5)), title =
          "Year", autorange = TRUE
      ),
      yaxis = list(
        range = c(0, (max(df$VZ_mw) * 1.5)), title =
          "Minimum Wage ($)", autorange = TRUE
      )
    )
  return(plot)
}

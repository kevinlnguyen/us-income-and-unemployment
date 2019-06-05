## Build a Scatterplot showing household data by state
build_scatter <- function(df, state) {
  ## filter by state
  df <- df %>%
    filter(State_Name == state)

  ## create a graph showing distinctions
  plot <- plot_ly(
    x = df$City,
    y = df$Median,
    type = "bar",
    ## This is to show how different geographical areas within a city affects
    ## median household
    text = ~ paste(
      "Latitude:", df$Lat,
      "<br>Longitude:", df$Lon
    )
  ) %>%
    layout(
      title = paste0("Household Income Across ", state),
      xaxis = list(title = "City"),
      yaxis = list(
        range = c(0, max(df$Median) * 1.5), title =
          "Combined Median Household Income per City ($)",
        autorange = TRUE
      )
    )
  return(plot)
}

## Read in Data
# income <- read.csv("acs2015_county_data.csv", stringsAsFactors = FALSE)
# specific_year <- function(data, state, race){
#
#   data <- data %>% filter(State == state)
#   data <- data %>% filter()
#
#   demo_graph <- ggplot(
#     data = data,
#     mapping = aes_string(x = input$)
#   )
# }
#
# demo_graph <- ggplot(
#   data = income,
#   mapping = aes_string(x = input$race, y = input$levels)) +
#   geom_point()
# labs(x = input$race, y = input$levels)
# return(demo_graph)
#
# ggplotly(demo_graph, tooltip = c("State"))
# demo <- function(dataset, input, input_two){
#   income_new <- dataset %>%
#     group_by(State) %>%
#     summarize("a" = mean(input), "b" = mean(input_two))
#   demo_graph <- ggplot(
#     data = income_new,
#     mapping = aes_string(x = "a", y = "b")) +
#     geom_point() +
#     geom_smooth() +
#     labs(x = input, y = input_two)
#   ggplotly(demo_graph)
# }
# demo(income, "Asian", "Unemployment")
# #
# income_new <- income %>%
#   group_by(State) %>%
#   summarize("a" = mean(income[['Asian']]), "b" = mean(income[['Unemployment']]))
# demo_graph <- ggplot(
#   data = income_new,
#   mapping = aes_string(x = "a", y = "b")) +
#   geom_point() +
#   geom_smooth() +
#   labs(x = "Asian", y = "unemployment")
# ggplotly(demo_graph)

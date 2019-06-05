## Read in Data 
income <- read.csv("data/acs2015_county_data.csv", stringsAsFactors = FALSE)

## Build a Scatterplot showing household data by state
build_scatter <- function(df, state) {
  
## filter by state
  df <- df %>% filter(State_Name == state)
  
## create a graph showing distinctions
  plot <- plot_ly(x = df$City,
                  y = df$Median,
                  type = "bar",
## This is to show how different geographical areas within a city affects 
## median household 
                  text = ~paste("Latitude:", df$Lat,
                                "<br>Longitude:", df$Lon)
                  ) %>%
    layout(title = paste0("Household Income Across ", state),
           xaxis = list(title = "City"),
           yaxis = list(range = c(0, max(df$Median) * 1.5), title = 
                          "Combined Median Household Income per City ($)",
                        autorange = TRUE)
    )
  return(plot)
}

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
#     summarize(mean = mean(Asian))
#   demo_graph <- ggplot(
#     data = income_new,
#     mapping = aes_string(x = input, y = input_two)) +
#     geom_point() +
#     geom_smooth() +
#     labs(x = input, y = input_two)
# }
# lol <- demo(income, "Asian", "Unemployment")
# 
# income_new <- income %>% 
#   group_by(State) %>% 
#   summarize(mean = mean(Asian))
# ggplot(
#   data = income_new,
#   mapping = aes_string(x = "Asian", y = "unemployment")) +
#   geom_point() +
#   geom_smooth() +
#   labs(x = "Asian", y = "unemployment")
# ggplotly(demo_graph)

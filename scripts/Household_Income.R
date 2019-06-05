## Read in Data 
income <- read.csv("data/kaggle_income.csv", stringsAsFactors = FALSE)

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
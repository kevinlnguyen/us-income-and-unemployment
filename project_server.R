library("dplyr")

## Select certain columns of dataset
wage_df <- read.csv("data/VZ_StateMinimumWage_Changes.csv", 
                    stringsAsFactors = FALSE)
wage_df <- wage_df %>% 
  select(statename, year, month, day, VZ_mw) %>% 
  filter(year != "2020") 

#Display short description by state
source("scripts/WA_Min_Wage_Chart.R")

project_server <- function(input, output){
  output$plot <- renderPlotly({
    return(build_scatter(wage_df, input$state_test))
  })
}
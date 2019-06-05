library("dplyr")

<<<<<<< HEAD
## Read in Minimum Wage Data 
min_wage <- read.csv("data/Minimum_Wage_Data.csv", stringsAsFactors = FALSE)

## Select certain columns of dataset
wage_df <- read.csv("data/VZ_StateMinimumWage_Changes.csv", 
                    stringsAsFactors = FALSE)
wage_df <- wage_df %>% 
  select(statename, year, month, day, VZ_mw) %>% 
  filter(year != "2020") 

#Display short description by state

source("scripts/WA_Min_Wage_Chart.R")
=======

min_wage <- read.csv("data/VZ_state_annual.csv", stringsAsFactors = FALSE)
unemployment <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)
>>>>>>> 91f87296d0a6f70ee3ad7e82bb135b93bad8fe9e

project_server <- function(input, output){
  output$plot <- renderPlotly({
    return(build_scatter(wage_df, input$state_test))
  })
}

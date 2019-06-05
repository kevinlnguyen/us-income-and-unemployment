library(dplyr)

source("scripts/unemploy_bar_plot.R")
source("scripts/WA_Min_Wage_Chart.R")
source("scripts/rate_plot_over_time.R")
source("scripts/Household_Income.R")

## Read in Minimum Wage Data
unemployment <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)

project_server <- function(input, output){
  output$plot <- renderPlotly({
    plot <- build_scatter(wage_df, input$state_test)
  })

  # Define a scatter plot to render in the UI
  output$rate_plot <- renderPlotly({
    rate_plot <- rate_plot_over_time(unemployment, input$state_input,
                                     input$year_input[1],
                                     input$year_input[2])
  })

  output$range <- renderPrint({
    input$slider2
  })

  output$line_plot_caption <- renderText({
    caption <- paste0("This data displays how the unemployment rate has
                      changed between the years ", input$year_input[1],
                      ", and ", input$year_input[2], " in ", input$state_input,
                      " state, seeking to answer how unemployment rate has
                      varied/fluctuated over time for a given state.")
  })

  output$states_year_bar_plot <- renderPlotly({
    unemploy_bar_plot(unemployment, input$year_bar_input)
  })

  output$bar_plot_caption <- renderText({
    caption <- paste0("This data displays how the unemployment rate varies
                      across states during the year ", input$year_bar_input,
                      " to show the unemployment disparity across the US.")
  })
  
  output$house_plot <- renderPlotly(
    return(build_scatter(income, input$state))
  )
  output$household_plot_caption <- renderText({
    house_cap <- paste0("This data displays the total median household income by ", 
                        input$state, " in regards to cities with different land and 
                        geographic sizes.")
  })
}

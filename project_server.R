library("dplyr")
library("shiny")

source("scripts/unemploy_bar_plot.R")
source("scripts/WA_Min_Wage_Chart.R")
source("scripts/rate_plot_over_time.R")
source("scripts/Household_Income.R")

## Read in Minimum Wage Data
unemployment <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)
## REad in 2015 data
income <- read.csv("data/acs2015_county_data.csv", stringsAsFactors = FALSE)


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
  output$house_plot <- renderPlotly({
    demo_graph <- ggplot(
      data = income,
      mapping = aes_string(x = input$race, y = input$levels)) +
      geom_point() +
      geom_smooth() +
      labs(x = input$race, y = input$levels)
    demo_graph <- ggplotly(demo_graph)
    return(demo_graph)
  })
  output$household_plot_caption <- renderText({
    house_cap <- paste0("This data displays ", input$levels, " % by % of ",
                        input$race, " population in 2015 showing a correlation 
                        with unemployment rates.")
  })
}

library("dplyr")
library("shiny")
library("plotly")
library("ggplot2")

# Loading the 'server' and 'ui' files into the 'app' file
source("app_ui.R")
source("app_server.R")

# Creating a shinyApp using the 'server' and 'ui'
shinyApp(ui = project_ui, server = project_server)

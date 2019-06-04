library("shiny")

source("project_ui.R")
source("project_server.R")

shinyApp(ui = project_ui, server = project_server)

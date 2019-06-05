library("shiny")

# Loading the 'server' and 'ui' files into the 'app' file
source("project_ui.R")
source("project_server.R")

# Creating a shinyApp using the 'server' and 'ui'
shinyApp(ui = project_ui, server = project_server)
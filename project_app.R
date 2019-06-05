<<<<<<< HEAD
library("shiny")
library("plotly")
library("ggplot2")
=======
library(shiny)
>>>>>>> dc35da87657eebeddcb648f70a0189489b857285

# Loading the 'server' and 'ui' files into the 'app' file
source("project_ui.R")
source("project_server.R")

# Creating a shinyApp using the 'server' and 'ui'
shinyApp(ui = project_ui, server = project_server)
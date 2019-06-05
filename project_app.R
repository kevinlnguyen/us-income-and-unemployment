<<<<<<< HEAD
library("shiny")
library("plotly")
library("ggplot2")
library(shiny)
=======
library("dplyr")
library("shiny")
library("plotly")
library("ggplot2")
>>>>>>> 5177f34f20a48d652d113e6fefbcdb7444c9f875

# Loading the 'server' and 'ui' files into the 'app' file
source("project_ui.R")
source("project_server.R")

# Creating a shinyApp using the 'server' and 'ui'
shinyApp(ui = project_ui, server = project_server)

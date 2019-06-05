library("shiny")
library(plotly)

wage_df <- read.csv("data/VZ_StateMinimumWage_Changes.csv", 
                    stringsAsFactors = FALSE)

wage_df <- wage_df %>% 
  select(statename, year, month, day, VZ_mw) %>% 
  filter(year != "2020")

states <- wage_df %>% 
  select(statename) %>% 
  unique()

states <- unlist(states, use.names = FALSE)

overview_page <- tabPanel("Overview",
                          titlePanel("Overview of the Project"),
                          mainPanel(
                            h1("Minimum Wage Across United States"),
                            p("Why are we interested about learning
                              this type of dataset?")
                          ))
interact_page_one <- tabPanel("Reported Minimum Wage by State",
                              sidebarLayout(sidebarPanel(
                                selectInput(
                                  "state_test",
                                  label = "Select a State",
                                  choices = states,
                                  selected = "Washington"
                                  )),
                                  mainPanel(plotlyOutput("plot"))
                                  ),
                              p("This data shows us the fluctuation of minimum
                                  wage by state, including whether or not 
                                changes occurred."))
interact_page_two <- tabPanel("Interactive Part 2",
                              titlePanel("Interactive Page 2"))
interact_page_three <- tabPanel("Interactive Part 3",
                                titlePanel("Interactive Page 3"))
summary_page <- tabPanel("Summary",
                         titlePanel("Summary of the Project"))
project_ui <- navbarPage(
  "Minimum Wage in the United States",
  overview_page,
  interact_page_one,
  interact_page_two,
  interact_page_three,
  summary_page
)

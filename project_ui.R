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

# Creates the introduction/project overview of the project
# and sets the style of the overall website itself
overview_page <- tabPanel("Project Overview",
  includeCSS("style.css"),
  mainPanel(h1("Minimum Wage Across United States"),
    p("United States has its own Federal Minimum Wage that each state can
    follow, but it's not a requirement to increase from that minimum.
    Different states tend to stay from that minimum or increase based
    upon how the state is doing economically. We will look at how the
    minimum wage changed in different states throughout the years and
    the effects of unemployment rate. We will use datas from the
    Department of Labor's Bureau of Labor Statistics and Washington
    Center for Equitable Growth (listed below)."),
    p(a("(1) Unemployment Rate in the United States",
        href = "https://www.kaggle.com/jayrav13/unemployment-by-county-us")),
    p(a("(2) State Minimum Wage in the United States",
        href = paste0("https://github.com/equitablegrowth/",
                      "VZ_historicalminwage/releases"))),
    p("Click on a tab to learn more")
  )
)

# Creates three tabs (pages) for each of the interactive visualization
interact_page_one <- tabPanel("Unemployment Rate Over Time",
                              titlePanel("Unemployment Rate")
)
interact_page_two <- tabPanel("Minimum Wage Throughout The Years",
  titlePanel("Minimum Wage")
)
interact_page_three <- tabPanel("Interactive Part 3",
  titlePanel("Interactive Page 3")
)

# Creates three tabs (pages) for each of the major takeaways from the analysis
takeaway_one <- tabPanel("Major Takeaway One",
  titlePanel("Minimum Wage Foundings")
)
takeaway_two <- tabPanel("Major Takeaway Two",
  titlePanel("Unemployment Rate Foundings")
)
takeaway_three <- tabPanel("Major Takeaway Three",
  titlePanel("Takeaway Three Foundings")
)

# Creates a new tab (page) that includes all team members' names
team_page <- tabPanel("Meet the Team",
  h2("The Creators"),
  h3(" > Kevin Nguyen"),
  h3(" > Harsimar Tumber"),
  h3(" > Oscar Perez"),
  h3(" > Alfred Escorpiso"))

# Creates the UI of the website itself with different
# navigation options that will lead to another tab/page
project_ui <- navbarPage(
  "Minimum Wages in the United States",
  overview_page,
  navbarMenu("Data Visualization", # Creates a menu bar for different pages
             interact_page_one,
             interact_page_two,
             interact_page_three),
  navbarMenu("What We Found", # Creates a menu bar for different pages
             takeaway_one,
             takeaway_two,
             takeaway_three),
  team_page
)

library("shiny")
library("plotly")
library("dplyr")

# Creates the introduction/project overview of the project
# and sets the style of the overall website itself
overview_page <- tabPanel("Project Overview",
                          includeCSS("style.css"),
                          mainPanel(
                            h1("Income and Unemployment Across United States"),
                            p("United States has its own Federal Minimum Wage
                            that each state can follow, but it's not a
                            requirement to increase from that minimum.
                            Different states tend to stay from that minimum
                            or increase based upon how the state is doing
                            economically. We will look at how the minimum
                            wage changed in different states throughout the
                            years and the effects of unemployment rate. We will
                            use datas from the Department of Labor's Bureau of
                            Labor Statistics and Washington Center for
                            Equitable Growth (listed below, respectively)."),
                            p(a("(1) Unemployment Rate in the United States",
                                href = paste0("https://www.kaggle.com/jayrav1",
                                              "3/unemployment-by-county-us"))),
                            p(a("(2) State Minimum Wage in the United States",
                                href = paste0("https://github.com/equitable",
                                              "growth/VZ_historicalminwage/",
                                              "releases"))),
                            p(a("(3) Household Income in the United States",
                                href = paste0("https://datahub.io/core/house",
                                              "hold-income-us-historical"))),
                            p("Click on a tab above to learn more")
                            )
                         )

# Creates a tab (page) for each of the interactive visualization
states <- wage_df %>%
  select(statename) %>%
  unique()
states <- unlist(states, use.names = FALSE)
unemployment_df <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)

unemployment_df <- unemployment_df %>%
  group_by(State, Year) %>%
  summarize(unemployment_rate = mean(Rate))

unemployment_states <- unemployment_df %>%
  select(State) %>%
  unique()

unemployment_states <- unlist(states, use.names = FALSE)

interact_one <- tabPanel("Reported Minimum Wage by State",
                              titlePanel("Minimum Wage Throughout The Years"),
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
interact_two <- tabPanel("Unemployment Rate",
  titlePanel("Unemployment Rates in the US"),
  # Create a sidebar layout for widgets and visual
  sidebarLayout(
    # Sidebar panel containing widgets to adjust visual
    sidebarPanel(
      # Select widget for X variable
      state_input <- selectInput(
        inputId = "state_input",
        label = "State",
        choices = unemployment_states
      ),
      year_input <- sliderInput(
        inputId = "year_input",
        label = "Year Range",
        min = 1990,
        max = 2016,
        value = c(1999, 2014)
      ),
      year_bar_input <- numericInput(
        inputId = "year_bar_input",
        label = "Year for Unemployment Rate Across States",
        min = 1990,
        max = 2016,
        value = 2000
      )
    ),
    # Main panel containing visual
    mainPanel(
      plotlyOutput("rate_plot"),
      textOutput("line_plot_caption"),
      plotlyOutput("states_year_bar_plot"),
      textOutput("bar_plot_caption")
    )
  )
)

# Creates a tab (page) for each of the major takeaways from the analysis
takeaway_one <- tabPanel("Major Findings One",
                         h1("Minimum Wage Findings")
                         )
takeaway_two <- tabPanel("Major Findings Two",
                         h1("Unemployment Rate Findings")
                         )
takeaway_three <- tabPanel("Major Findings Three",
                           h1("Takeaway Three Findings")
                           )

# Creates a new tab (page) that includes all team members' names
team_page <- tabPanel("Meet the Team",
                      h1("The Creators"),
                      h3(" > Kevin Nguyen"),
                      h3(" > Harsimar Tumber"),
                      h3(" > Oscar Perez"),
                      h3(" > Alfred Escorpiso")
                      )

# Creates the UI of the website itself with different
# navigation options that will lead to another tab/page
project_ui <- navbarPage("Minimum Wages in the United States",
                         overview_page,
                         navbarMenu("Data Visualization",
                                    interact_one,
                                    interact_two
                                    ),
                         navbarMenu("What We Found",
                                    takeaway_one,
                                    takeaway_two,
                                    takeaway_three
                                    ),
                         team_page
                         )
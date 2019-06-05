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
wage_df <- read.csv("data/VZ_state_annual.csv")
states <- wage_df %>%
  select(Name) %>%
  unique()
states <- unlist(states, use.names = FALSE)

unemployment_df <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)

min_year <- min(unemployment_df$Year)
max_year <- max(unemployment_df$Year)

unemployment_states <- unemployment_df %>%
  select(State) %>%
  unique()

unemployment_states <- unlist(unemployment_states, use.names = FALSE)

interact_one <- tabPanel("Reported Minimum Wage by State",
                              h1("Minimum Wage Throughout The Years"),
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
                                changes occurred.")
                          )
interact_page_three <- tabPanel("Interactive Part 3",
  titlePanel("Interactive Page 3")
)
interact_two <- tabPanel("Unemployment Rate",
                         h1("Unemployment Rates in the US"),
                         # Create a sidebar layout for widgets and visual
                         sidebarLayout(
                           # Sidebar panel containing widgets to adjust visual
                           sidebarPanel(
                             # Select widget for X variable
                             state_input <- selectInput(
                               inputId = "state_input",
                               label = "State (Unemployment Rate Over Time)",
                               choices = unemployment_states
                               ),
                             year_input <- sliderInput(
                               inputId = "year_input",
                               label = "Year Range (Unemployment Rate Over
                                       Time)",
                               min = min_year,
                               max = max_year,
                               value = c(1999, 2014)
                               ),
                             year_bar_input <- numericInput(
                               inputId = "year_bar_input",
                               label = "Year (Unemployment Rate Across States)",
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
takeaways <- tabPanel("Takeways",
                      h1("Major Takeaways from the Project"),
                      h2("Relationships/Correlation between Minimum Wage and
                         Unemployment"),
                      p("For the time frame that we have data for (1990 to
                        2016), minimum wage for all states seems to have an
                        increasing trend. When compared to unemployment rates,
                    we can see that unemployment rates do not have a strong correlation to minimum wage, and are affected by other factors.
                        Nearly every state had a major spike in unemployment rates around the years 2007 to 2011 when the Great Recession occurred. Unemployment
                        rates tend to fluctuate greatly as they change from increasing to decreasing and vice-versa, unlike minimum wage. Specifically within the
                        data, from 2008 to 2010, Washington unemployment rate increases drastically and then begins to decrease, while minimum wage continuously
                        increases during that time frame. Overall, this displays how other factors affect unemployment rates."),
                      h2("Disparities in Minimum Wage and Unemployment"),
                      p("In each year, there is a great disparity in unemployment rate across states. Specifically within our data, in the year 1992, Nebraska had
the lowest unemployment rate of around 2.6%, while West Virginia had an unemployment rate of around 12.7%. This gap in unemployment rate
can be seen across all years, which greatly contrasts with the minimum wage across states. For the same year, the lowest minimum wage
amount was $4.25 compared to the highest minimum wage amount of $4.85. These values are much closer than the unemployment rates in the same
year, and these relatively miniscule gaps in minimum wage across states are visible across all years. In summary, this shows how minimum
wage remains rather consistent across the US, whereas unemployment rate does not and is more unpredictable."),
                      h2("Unemployment and Poverty Disparities in Different Races"),
                      p("Diving into the year 2015, looking at the unemployment rates through the lens of racial demographics backs us our main points that unemployment
rates correlate with poverty rates. One distinction we see is that even though there is a small population percentage of Asian Americans, poverty 
and unemployment rates vastly range across the board. Meanwhile, this can be seen for both the African American and Hispanic demographic as well.")
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
                         takeaways,
                         team_page
                         )

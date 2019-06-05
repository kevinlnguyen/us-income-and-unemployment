# getting the data ----------------------------------------------------

income_kaggle <- read.csv("data/kaggle_income.csv", stringsAsFactors = FALSE)
unemployment_df <- read.csv("data/unemployement.csv", stringsAsFactors = FALSE)
income <- read.csv("data/acs2015_county_data.csv", stringsAsFactors = FALSE)
wage_df <- read.csv("data/VZ_state_annual.csv", stringsAsFactors = FALSE)

# working with data ---------------------------------------------------

# getting the minimum and maximum years
min_year <- min(unemployment_df$Year)
max_year <- max(unemployment_df$Year)


# For tabPanel 1
state_name <- income_kaggle %>%
  select(State_Name) %>%
  unique()
state_name <- unlist(state_name, use.names = FALSE)

# For tabPanel2
states <- wage_df %>%
  select(Name) %>%
  unique()
states <- unlist(states, use.names = FALSE)


unemployment_df_new <- unemployment_df %>%
  group_by(State, Year) %>%
  summarize(unemployment_rate = mean(Rate))

unemployment_states <- unemployment_df_new %>%
  select(State) %>%
  unique()
unemployment_states <- unlist(unemployment_states, use.names = FALSE)

# widgets ----------------------------------------------------------

state_names <- unemployment_df %>%
  select(State) %>%
  arrange(State) %>% # Alphabetizing the states
  distinct(State) # Getting each individual state

year_slider <- sliderInput(
  "years",
  label = "Years",
  min = min_year,
  max = max_year,
  value = c(min_year, max_year)
)
year_bar <- numericInput(
  inputId = "year_bar",
  label = "Year (Minimum wage across States)",
  min = 1990,
  max = 2016,
  value = 2000
)

states <- selectInput(
  "select_state",
  label = "Select State",
  choices = state_names,
  selected = "Washington"
)

# pages ------------------------------------------------------------

# Creates the introduction/project overview of the project
# and sets the style of the overall website itself
overview_page <- tabPanel(
  "Project Overview",
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
        Labor Statistics, Washington Center for Equitable
        Growth and Demographic and Economic Data for Tracts
        and Counties (listed respectively)."),
    p(a("(1) Unemployment Rate in the United States",
        href = paste0(
          "https://www.kaggle.com/jayrav1",
          "3/unemployment-by-county-us"
        )
    )),
    p(a("(2) State Minimum Wage in the United States",
        href = paste0(
          "https://github.com/equitable",
          "growth/VZ_historicalminwage/",
          "releases"
        )
    )),
    p(a("(3) US Census Demographic Data",
        href = paste0(
          "https://www.kaggle.com/muonne",
          "utrino/us-census-demographic",
          "data"
        )
    )),
    p("Click on a tab above to learn more")
  )
)

# -----------------------------------------------------------------------------------

# Creates a tab (page) for each of the interactive visualization
interact_one <- tabPanel(
  "Racial Demographic Poverty Levels",
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "race",
        "Select A Racial Demographic",
        choices = list(
          "Hispanic" = "Hispanic",
          "White" = "White",
          "Black" = "Black",
          "Native" = "Native",
          "Asian" = "Asian",
          "Pacific" = "Pacific"
        ),
        selected = "Asian"
      ),
      selectInput(
        "levels",
        "Outcome of Interest",
        choices = list(
          "Unemployment Rates" = "Unemployment",
          "Poverty Rates" = "Poverty"
        )
      )
    ),
    mainPanel(
      plotlyOutput("house_plot"),
      textOutput("household_plot_caption")
    )
  )
)

# -----------------------------------------------------------------------------------

interact_two <- tabPanel(
  "Unemployment Rate",
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
        min = min_year,
        max = max_year,
        value = 2000
      )
    ),
    # Main panel containing visual
    mainPanel(
      plotlyOutput("rate_plot"),
      textOutput("line_plot_caption"),
      h1(),
      h1(),
      plotlyOutput("states_year_bar_plot"),
      textOutput("bar_plot_caption")
    )
  )
)

# -----------------------------------------------------------------------------------

interact_three <- tabPanel(
  "Minimum wage over the years", # Tab Name
  titlePanel("Minimum Wage"),
  # Description of line graph"
  p("On this page I am visualizing the minimum wage data and how it changes over the years.
    You can choose the state and the time period for
    which you cant to see the change in minimum wage.
    You can also select a year to compare the minimum wage for that year for all the states. 
    These graphes can help you viualize how the minimum wage 
    has changes over the years and in every state."),
  p("By looking at the trend you can see that how the minimum wage has always been increasing"),
  h4("Choose a State and time period for the data"),
  h1(), # Creating space between text and widgets/graphs
  h1(),
  
  # Start of data
  sidebarLayout(
    sidebarPanel(
      # Widgets
      states,
      year_slider,
      year_bar
    ),
    mainPanel(
      plotlyOutput("mw_graph"),
      h1(),
      plotlyOutput("mw_bar")
    )
  )
)

# -----------------------------------------------------------------------------------

# Creates a tab (page) for each of the major takeaways from the analysis
takeaways <- tabPanel(
  "Takeways",
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

# -----------------------------------------------------------------------------------

# Creates a new tab (page) that includes all team members' names
team_page <- tabPanel(
  "Meet the Team",
  h1("The Creators"),
  h3(" > Kevin Nguyen"),
  h3(" > Harsimar Tumber"),
  h3(" > Oscar Perez"),
  h3(" > Alfred Escorpiso")
)

# creating the UI --------------------------------------------------

# Creates the UI of the website itself with different
# navigation options that will lead to another tab/page
project_ui <- navbarPage(
  "Minimum Wages in the United States",
  overview_page,
  navbarMenu(
    "Data Visualization",
    interact_one,
    interact_two,
    interact_three
  ),
  takeaways,
  team_page
)

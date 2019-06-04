library("shiny")

overview_page <- tabPanel("Overview",
                          titlePanel("Overview of the Project"))
interactive_page_one <- tabPanel("Interactive Part 1",
                                 titlePanel("Interactive Page 1"))
interactive_page_two <- tabPanel("Interactive Part 2",
                                 titlePanel("Interactive Page 2"))
interactive_page_three <- tabPanel("Interactive Part 3",
                                   titlePanel("Interactive Page 3"))
summary_page <- tabPanel("Summary",
                         titlePanel("Summary of the Project"))
project_ui <- navbarPage(
  "Minimum Wage in the United States",
  overview_page,
  interactive_page_one,
  interactive_page_two,
  interactive_page_three,
  summary_page
)
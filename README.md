# Final Deliverable
[Final Shiny Application](https://oscar-perez1.shinyapps.io/wage_and_unemployment_in_the_us/)

[Research Webpage](https://kevinlnguyen.github.io/us-income-and-unemployment/)

*Final group project for INFO 201: Intellectual Foundations of Informatics at the University of Washington (Spring 2019).*

# Project Brainstorm

## Domain of Interest

### Why are you interested in this field/domain?

We are interested in the field/domain because we want to understand the changes of the consumer price index (CPI) in the U.S. over the past decade in regards to inflation and increased the cost of living. The sub-datasets we’ve found gives us a great implication of how advances in modern society have to lead to changes in the United States’ economic structure over time. Looking at CPI’s at different levels allows us to evaluate how markets can influence spending across all general categories.


### What other examples of the data-driven project have you found related to this domain (share at least 3)?

* One project found was on the Seattle Minimum Wage study which investigated the impact of minimum wage on metropolitan areas. It looked at how the current increases in minimum wage affected households, businesses, and employment. [Link to the project](https://evans.uw.edu/policy-impact/minimum-wage-study)
* Another project found was on predicting how minimum wage increases would affect the wages of workers across the country in the near future. It looked at how what type of workers would be affected by increases, how much of an increase they would receive, and how many would be affected along with what percentage of the employment force they consist of. [Link to the project](https://www.epi.org/publication/data-tables-raising-the-minimum-wage-to-12-by-2020-would-lift-wages-for-35-million-workers/)
* Another project provided data in visualizations about federal minimum wages over time. It looked at how minimum wage affected quality of life and the history of raises in their raw forms and adjusted for inflation. [Link to the project](https://www.washingtonpost.com/business/minimum-wage/2018/11/20/4892360e-ecf0-11e8-8b47-bd0975fd6199_story.html?utm_term=.a86bcb7c3d24)


### What data-driven questions do you hope to answer about this domain (share at least 3)?

* How has the economy changed over the years?
* How has a change of price in the consumer goods affected our economy and changes the minimum wage over the years?
* How has the unemployment rate for each state changed over the years and did it affect the minimum wage of that state with it?
* How does minimum wage compare when grouping by state or year?


## Finding Data

### U.S. Minimum Wage by State 1968-2017 by Joseph Lisle

* Where did you download the data (e.g., a web URL)?
    > https://www.kaggle.com/lislejoem/us-minimum-wage-by-state-from-1968-to-2017

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
    > This data was collected from the U.S. Department of Labor’s website. The author, Joseph Lisle collected the data to filter out a clean dataset of the minimum wage by state. The data filters out the year, state, a high value of proposed minimum wage, and low value of the proposed minimum wage by year based on the federal laws protecting wage workers.

* How many observations (rows) are in your data?
    > 2750 rows

* How many features (columns) are in the data?
    > 9 features

* What questions (from above) can be answered using the data in this dataset?
    > A few questions that can be answered using the data is how minimum wages grouped by year in each state varied when comparing per state. At the same time, we can group by year to compare rates of change due to other factors such as inflation, increased cost of living, etc.


### Consumer Price Index by U.S. Bureau Labor of Statistics

* Where did you download the data (e.g., a web URL)?
    > https://www.kaggle.com/bls/consumer-price-index

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
    > The data was collected directly from the U.S. Bureau of Labor Statistics website. It was built by U.S. Bureau of Labor Statistics themselves and converted the data into a .csv file. It splits into multiple datasets that represent what each of the codes and numbers mean in every dataset based under the location of the population, and the goods and services provided (beverages, housing, etc.).

* How many observations (rows) are in your data?
    > Varies from 11,900 rows to 674,000 rows

* How many features (columns) are in the data?
    > 5 columns

* What questions (from above) can be answered using the data in this dataset?
    > This data can answer questions such as what consumers in the United States spent money on and what was valued highly during that time period. This is great for situations such as the 2008 economic recession where consumer spending decreased due to increased rates of unemployment across the country.


### US Unemployment Rate by Country, 1990-2016

* Where did you download the data (e.g., a web URL)?
    > https://www.kaggle.com/jayrav13/unemployment-by-county-us

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
    > The data was collected by scraping the United States Department of Labor’s Bureau of Labor Statistics. The person who built the data was Jay Ravaliya. This data represents the local area unemployment statistics from the years 1990 to 2016. This data is also broken down by state and month.

* How many observations (rows) are in your data?
    > 886,000 rows

* How many features (columns) are in the data?
    > 5 features

* What questions (from above) can be answered using the data in this dataset?
    > This dataset can help us answer questions like how has the unemployment rate changed over the years and how did it affect the economy and the minimum wage with it.

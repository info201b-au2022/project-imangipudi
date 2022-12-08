library(dplyr)
library(stringr)
library(maps)
library(ggplot2)

crude_rates <- read.csv(file = "https://raw.githubusercontent.com/info201b-au2022/project-imangipudi/main/data/crude_rates.csv",
                        stringsAsFactors = F)

#Interactive page 1
countries_list <- unique(crude_rates$Country)
sexes <- unique(crude_rates$Sex)
world <- map_data("world")
world <- rename(world, Country = region)

bar_data <- function(country) {
  crude_rates %>%
  select(Country, Sex, x2019) %>%
  filter(Country == country,
         Sex != "Both sexes")
}

new_map <- function(country, sex) {
  map_df <- crude_rates %>%
  select(Country, Sex, x2019, x2018, x2017, x2016) %>%
  filter(Country == country,
         Sex == sex) %>%
  left_join(world, by = "Country") 
}

#Interactive page 2
bar_df <- data.frame(years = c("2019", "2018", "2017", "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000"),
                     avg_crude_rates = c(10.08689, 10.24699, 10.43388, 10.68197, 10.98852, 11.22579, 11.41694, 11.62678, 11.6847, 11.87541, 12.08306, 12.06831, 12.01803, 12.16284, 12.37596, 12.41913, 12.58743, 12.79454, 12.94481, 13.2306))

filter_df <- function(year1, year2) {
  bar_df %>%
  filter(years < year1)
}

#Interactive page 3
datas <- data.frame(
  age = c("xover85", "x75-84","x65-74","x55-64","x45-54","x35-44","x25-34","x15-24"),
  avg_suicide_rate = c(69.39253, 29.81421, 21.82769, 17.93862, 15.57505, 12.92222, 10.74372,7.725683))   

filter_data <- function(age1, age2) {
  a <- c(age1, age2)
  df <- datas %>%
    filter(age %in% a)
  return(df)
}

#server
server <- function(input, output) {
  
  #render barchart
  output$barchart <- renderPlot ({
    barchart <- ggplot(bar_data(input$country1), aes(x = Sex, y = x2019)) +
      geom_bar(stat = "identity", fill = "#336596")
    barchart
  })  
  
  #render map plot
  output$map <- renderPlot({
    title = "123"
    map <- ggplot(new_map(input$country, input$sex)) + 
      geom_polygon(aes(x = long, y = lat, group = group, fill = x2019)) +
      labs(caption = "hi")
    map
  })
  
  #render chart
  output$ages <- renderPlot({
    title = "Age"
    ages <- ggplot(filter_data(input$age1, input$age2), aes(x = age, y = avg_suicide_rate))+
      geom_point(aes(size = 5))
    ages
  })
  
  #render chart
  output$bar <- renderPlot ({
    title = "Average Suicide Rates Per Year"
    bar <- ggplot(filter_df(input$year1), aes(x = years, y = avg_crude_rates, fill = avg_crude_rates)) +
      geom_bar(stat = "identity", fill = input$color)
    bar
  })
  
  
}


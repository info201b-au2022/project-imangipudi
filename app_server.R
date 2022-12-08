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

new_map <- function(country, sex) {
  map_df <- crude_rates %>%
  select(Country, Sex, x2019, x2018, x2017, x2016) %>%
  filter(Country == country,
         Sex == sex) %>%
  left_join(world, by = "Country") 
}

#Interactive page 2




#Interactive page 3
datas <- data.frame(
  age = c("xover85", "x75-84","x65-74","x55-64","x45-54","x35-44","x25-34","x15-24"),
  avg_age_rate = c(69.39253, 29.81421, 21.82769, 17.93862, 15.57505, 12.92222, 10.74372,7.725683))   

filter_data <- function(age1, age2) {
  a <- c(age1, age2)
  df <- datas %>%
    filter(age %in% a)
  return(df)
}

#server
server <- function(input, output) {
  
  #render map plot
  output$map <- renderPlot({
    title = "123"
    map <- ggplot(new_map(input$country, input$sex)) + 
      geom_polygon(aes(x = long, y = lat, group = group, fill = x2019)) +
      labs(caption = "hi")
    map
  })
  
  output$ages <- renderPlot({
    title = "Age"
    ages <- ggplot(filter_data(input$age1, input$age2), aes(x = age, y = avg_age_rate))+
      geom_point(aes(size = 5))
    ages
  })
  
  
}
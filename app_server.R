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

map_data <- function(country, sex) {
  map_df <- crude_rates %>%
  select(Country, Sex, x2019, x2018, x2017, x2016) %>%
  filter(Country == country,
         Sex == sex) %>%
  left_join(world, by = "Country") 
}

#Interactive page 2


#Interactive page 3


server <- function(input, output) {
  
  #render map plot
  output$map <- renderPlot({
    title = "123"
    map <- ggplot(map_data(input$country, input$sex)) + 
      geom_polygon(aes(x = long, y = lat, group = group, fill = x2019)) +
      labs(caption = "hi")
    map
  })
  
  
}
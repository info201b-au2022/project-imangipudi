# installing and loading neccesary packages
install.packages("ggplot2")
install.packages("plotly")
library(ggplot2)
library(dplyr)
library(stringr)

crude_rates <- read.csv(
  file = "https://raw.githubusercontent.com/info201b-au2022/project-imangipudi/main/data/ratescrude.csv",
  stringsAsFactors = FALSE
  )
View(crude_rates)

get_rates <- function(year){
  new <- str_replace_all(year, " \\s*\\[[^\\)]+\\]", "")
  return(new)
}

new_crude_rates <- crude_rates %>%
  mutate("x2019" = get_rates(X2019),
         "x2018" = get_rates(crude_rates$X2018),
         "x2017" = get_rates(crude_rates$X2017),
         "x2016" = get_rates(crude_rates$X2016),
         "x2015" = get_rates(crude_rates$X2015),
         "x2014" = get_rates(crude_rates$X2014),
         "x2013" = get_rates(crude_rates$X2013),
         "x2012" = get_rates(crude_rates$X2012),
         "x2011" = get_rates(crude_rates$X2011),
         "x2010" = get_rates(crude_rates$X2010),
         "x2009" = get_rates(crude_rates$X2009),
         "x2008" = get_rates(crude_rates$X2008),
         "x2007" = get_rates(crude_rates$X2007),
         "x2006" = get_rates(crude_rates$X2006),
         "x2005" = get_rates(crude_rates$X2005),
         "x2004" = get_rates(crude_rates$X2004),
         "x2003" = get_rates(crude_rates$X2003),
         "x2002" = get_rates(crude_rates$X2002),
         "x2001" = get_rates(crude_rates$X2001),
         "x2000" = get_rates(crude_rates$X2000)
  )

crude_rates2 <- select(new_crude_rates, -c(X2019, X2018, X2017, X2016, X2015, X2014,
                                           X2013, X2012, X2011, X2010, X2009, X2008,
                                           X2007, X2006, X2005, X2004, X2003, X2002,
                                           X2001, X2000))

View(crude_rates2)

plot_data <- crude_rates2 %>%
  select(Country, Sex, x2019, x2018, x2017, x2016, x2015, x2014, x2013, x2012, x2011, x2010, x2009, x2008, x2007, x2006, x2005, x2004, x2003, x2002, x2001, x2000) %>%
  filter(Sex == "Both sexes") %>%
  select(x2019, x2018, x2017, x2016, x2015, x2014, x2013, x2012, x2011, x2010, x2009, x2008, x2007, x2006, x2005, x2004, x2003, x2002, x2001, x2000) 

  View(plot_data)

new_data <- summarize(
  plot_data,
  mean_2019 = mean(as.double(x2019)), 
  mean_2018 = mean(as.double(x2018)), 
  mean_2017 = mean(as.double(x2017)), 
  mean_2016 = mean(as.double(x2016)), 
  mean_2015 = mean(as.double(x2015)), 
  mean_2014 = mean(as.double(x2014)), 
  mean_2013 = mean(as.double(x2013)), 
  mean_2012 = mean(as.double(x2012)), 
  mean_2011 = mean(as.double(x2011)), 
  mean_2010 = mean(as.double(x2010)), 
  mean_2009 = mean(as.double(x2009)), 
  mean_2008 = mean(as.double(x2008)), 
  mean_2007 = mean(as.double(x2007)), 
  mean_2006 = mean(as.double(x2006)), 
  mean_2005 = mean(as.double(x2005)), 
  mean_2004 = mean(as.double(x2004)), 
  mean_2003 = mean(as.double(x2003)), 
  mean_2002 = mean(as.double(x2002)), 
  mean_2001 = mean(as.double(x2001)), 
  mean_2000 = mean(as.double(x2000))
)
data <- data.frame(
  years = c("2019", "2018", "2017", "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000"),
  avg_crude_rates = c(10.08689, 10.24699, 10.43388, 10.68197, 10.98852, 11.22579, 11.41694, 11.62678, 11.6847, 11.87541, 12.08306, 12.06831, 12.01803, 12.16284, 12.37596, 12.41913, 12.58743, 12.79454, 12.94481, 13.2306)
  )
View(data)

ggplot(data, aes(x= years, y = avg_crude_rates, fill =x)) +
  geom_bar(stat = "identity", fill = "pink")

  
 

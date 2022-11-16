library(dplyr)
library(stringr)
crude_rates <- read.csv(file = "https://raw.githubusercontent.com/info201b-au2022/project-imangipudi/main/data/ratescrude.csv", stringsAsFactors = FALSE)
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
  )

crude_rates2 <- select(new_crude_rates, -c(X2019, X2018, X2017, X2016, X2015, X2014,
                                           X2013, X2012, X2011, X2010, X2009, X2008,
                                           X2007, X2006, X2005, X2004, X2003, X2002,
                                           X2001, X2000))
crude_rates2$x2019 <- as.numeric(crude_rates2$x2019)
crude_rates2$x2018 <- as.numeric(crude_rates2$x2018)
crude_rates2$x2017 <- as.numeric(crude_rates2$x2017)
crude_rates2$x2016 <- as.numeric(crude_rates2$x2016)                       
crude_rates2$x2015 <- as.numeric(crude_rates2$x2015)
crude_rates2$x2014 <- as.numeric(crude_rates2$x2014)
crude_rates2$x2013 <- as.numeric(crude_rates2$x2013)
crude_rates2$x2012 <- as.numeric(crude_rates2$x2012)
crude_rates2$x2011 <- as.numeric(crude_rates2$x2011)
crude_rates2$x2010 <- as.numeric(crude_rates2$x2010)
crude_rates2 <- mutate(crude_rates2, average = rowMeans(subset(crude_rates2, select = c(x2019, x2018, x2017, x2016, x2015, x2014, x2013, x2012, x2011, x2010))))
crude_rates2 <- filter(crude_rates2, Sex == "Both sexes")
install.packages("kableExtra")
library(kableExtra)
library(knitr)

most_rates <- crude_rates2 %>% 
  group_by(Country) %>% 
  summarize(Frequency = average) %>% 
  top_n(20) %>% 
  arrange(desc(Frequency))



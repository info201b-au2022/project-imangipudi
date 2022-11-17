library(dplyr)
library(ggplot2)



crude_rates <- read.csv(
  file = "https://raw.githubusercontent.com/info201b-au2022/project-imangipudi/main/data/ratescrude.csv",
  stringsAsFactors = F
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
crude_rates2$x2019 <- as.numeric(crude_rates2$x2019)
summary_info <- list()
summary_info$num_observations <- nrow(crude_rates2)
summary_info$num_years <- (ncol(crude_rates2) - 2)
summary_info$num_countries <- length(unique(crude_rates2$Country))
summary_info$highest_country_2019 <- filter(crude_rates2, Sex == "Both sexes") %>% 
  filter(x2019 == max(x2019)) %>% 
  pull(x2019)
summary_info$highest_rate_2019 <- filter(crude_rates2, Sex == "Both sexes") %>% 
  filter(x2019 == max(x2019)) %>% 
  pull(Country)

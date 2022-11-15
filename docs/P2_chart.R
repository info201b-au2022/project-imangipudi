#P2
#pie chart 
#Which age group has the largest amount of suicide?
library(ggplot2)
library(tidyverse)
library(dplyr)
library(stringr)

age_crudedata <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-imangipudi/main/data/age_data_headers.csv", header = TRUE, sep = ",")
View(age_crudedata)

#filtering for less data
#over_20 <- filter(age_crudedata, xover_85 >200 )
#View(over_20)

#g <- ggplot(diamonds, aes(x = age, y =avg_age_rate))

#ggplot(datas, aes(x = age, y = avg_age_rate))+
#geom_count(aes(colour= green))
       

ggplot(datas, aes(x=age, y=avg_age_rate))+
  geom_point(aes(size=avg_age_rate))



rlang::last_error()
#pie(over_20)
#?geom_bar


new_dataframe <- summarize(
  age_crudedata,
  mean_85 = mean(as.double(xover_85)),
  mean_75 = mean(as.double(x75_84)),
  mean_65 = mean(as.double(x65_74)),
  mean_55 = mean(as.double(x55_64)),
  mean_45 = mean(as.double(x45_54)),
  mean_35 = mean(as.double(x35_44)),
  mean_25 = mean(as.double(x25_34)),
  mean_15 = mean(as.double(x15_24)),
)
View(new_dataframe)


datas <- data.frame(
  age = c("xover_85", "x75_84","x65_74","x55_64","x45_54","x35_44","x25_34","15_24"),
  avg_age_rate = c(69.39253, 29.81421, 21.82769, 17.93862, 15.57505, 12.92222, 10.74372,7.725683)
)
View(datas)


#pie(datas$)
#pie(age_crude_data2$`x85+ years of age`, labels = )




# lab1 exercise
#  load the required packages
library(statsr)
library(dplyr)
library(shiny)
library(ggplot2)

# load ames data:
data(ames)

# plotting the price column and finding summary stats about:
ggplot(data = ames, aes(x = price)) + geom_histogram(binwidth = 20000) # the distribution takes right skew shape.
ames %>%
  summarise(mu = mean(price), pop_median = median(price), sigma = sd(price),
            pop_iqr = IQR(price), pop_min = min(price),
            pop_max = max(price), pop_q1 = quantile(price, 0.25),
            pop_q3 = quantile(price, 0.75)) #mean of pop price = 180796.1


  
  
  
  
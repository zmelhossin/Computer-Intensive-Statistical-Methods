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
#-----------------------------------------------------
# E1: Take a random sample of size 50 from price. Using this sample, what is your best point estimate of the 
#population mean?
sampl <- ames %>%
  sample_n(size = 50)
mean(sampl$price) # sample size 50 mean = 185798.7 "best point estimate for pop mean"


#E2: Since you have access to the population, simulate the sampling distribution for 𝑥̅𝑝𝑟𝑖𝑐𝑒 by taking 5000 
#samples from the population of size 50 and computing 5000 sample means. Store these means in a vector 
#called sample_means50. Plot the data, then describe the shape of this sampling distribution. Based on this 
#sampling distribution, what would you guess the mean home price of the population to be?








  

  
  
  
  
  
  
  
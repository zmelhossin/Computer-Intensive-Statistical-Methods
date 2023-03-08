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
sample_means_50 <- ames %>%
  rep_sample_n(size = 50, reps = 5000, replace = T) %>%
  summarise(x_bar = mean(price))
ggplot(data = sample_means_50, aes(x = x_bar)) + geom_histogram(binwidth = 2000) # the shape of the sampling is normal distribution
mean(sample_means_50$x_bar) # the sampling mean = 180611
mean(ames$price) # the pop mean = 180796.1   they are very close.


#E3: Change your sample size from 50 to 150, then compute the sampling distribution using the same method 
#as above, and store these means in a new vector called sample_means150. Describe the shape of this 
#sampling distribution and compare it to the sampling distribution for a sample size of 50. Based on this 
#sampling distribution, what would you guess to be the mean sale price of homes in Ames?
sample_means150 <- ames %>%
  rep_sample_n(size = 150, reps = 5000, replace = T) %>%
  summarise(x_bar = mean(price))
ggplot(data = sample_means150, aes(x = x_bar)) + geom_histogram(binwidth = 2000) # the two of 50 and 150 follows normal distibution.
mean(sample_means150$x_bar) # the sampling mean = 180883.8
mean(ames$price) # the pop mean = 180796.1 # the mean of 150 sampling is closer to the pop mean than 50 sampling.


#E4: Take a sample of size 15 from the population and calculate the mean price of the homes in this sample. 
#Using this sample, what is your best point estimate of the population mean of prices of homes?
sample_15 <- ames %>%
  sample_n(size = 15)
mean(sample_15$price) # the mean of 15 sample = 176473.9

#E5: Since you have access to the population, simulate the sampling distribution for 𝑥̅𝑝𝑟𝑖𝑐𝑒 by taking 2000 
#samples from the population of size 15 and computing 2000 sample means. Store these means in a vector 
#called sample_means15. Plot the data, then describe the shape of this sampling distribution. Based on this 
#sampling distribution, what would you guess the mean home price of the population to be? Finally, calculate 
#and report the population mean
sample_means15 <- ames %>%
  rep_sample_n(size = 15, reps = 2000, replace = T) %>%
  summarise(x_bar = mean(price))
ggplot(data = sample_means15, aes(x = x_bar)) + geom_histogram(binwidth = 2000) # the dist is normal  (shape).
mean(sample_means15$x_bar)# the mean of 15 sampling = 180726.2
mean(ames$price) # the population mean = 180796.1  !!!

#E6: Change your sample size from 15 to 150, then compute the sampling distribution using the same method 
#as above, and store these means in a new vector called sample_means150. Describe the shape of this 
#sampling distribution and compare it to the sampling distribution for a sample size of 15. Based on this 
#sampling distribution, what would you guess to be the mean sale price of homes in Ames
sample_means150 <- ames %>%
  rep_sample_n(size = 150, reps = 2000, replace = T) %>%
  summarise(x_bar = mean(price))
ggplot(data = sample_means150, aes(x = x_bar)) + geom_histogram(binwidth = 2000) # the dist is normal  (shape) just like sampling dist of 15.
mean(sample_means15$x_bar)# the mean of 150 sampling = 180726.2  this is the same mean result using the sampling of 15.
mean(ames$price) # the population mean = 180796.1  !!!













  

  
  
  
  
  
  
  